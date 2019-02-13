function [result dX]=badshim_warp(BW,fmap,data,factor,shift)
% [result dX]=badshim_warp(BW,fmap,data,factor,shift)
% fmap is 2D field map, e.g.128x128, in Tesla
% BW is bandwidth when acquiring the field map (in Hz)
% data is 5D images to warp: e.g. 128x128x1x8x40 (Ny,Nx,Nz,Ncoils,Nt)
% shift is the number of pixel to shift 
%% 
gamma = 42.576;			% MHz/T
Ny = size(data,1);		% All images assumed to have same Ny
Nx = size(data,2);		% All images assumed to have same Nx
Ncoils = size(data,4);
Nt = size(data,5);

%CSM [X Y]=(meshgrid(1:Ny, 1:Nx));	% Y will not get modified, not warping along y
[X Y]=(meshgrid(1:Nx, 1:Ny));
BW_per_pix = 2*BW/Nx;		% Bandwidth per pixel

%% Calculate the amount of warping required
dX = zeros(Ny,Nx);		% Unwarped version of X is X_uw (= X + dX)
X_uw = zeros(Ny,Nx);
num_iter = 4;           	% Number of iterations, 4 seems to be enough
fm = (factor)*fmap;	% Pick right field map
disp('Calculating warping ...   ');
   for i = 1:Nx
      for j = 1:Ny
         % Iterate
         % CSM disp([num2str(i),'  ',num2str(j)])
         X_uw(j,i) = X(j,i);	% Zeroth iteration, dX = 0
         for it = 1:num_iter
            % Find field offset value at this particular location
            xm = floor(X_uw(j,i));		% Nearest pixel, -x direction
            xp = ceil(X_uw(j,i));		% Nearest pixel, +x direction
            xm = max(xm, 1);			% Sanity check
            xp = min(xp, Nx);			% Sanity check
            valm = fm(j, xm);
            valp = fm(j, xp);
            wm = 1 - (X_uw(j,i)-xm);
            wp = 1 - (xp-X_uw(j,i));
            f = (wm*fm(j,xm) + wp*fm(j,xp))/(wm+wp);	% Interpolate
            % Find the dX associated with this field value
            s = -1;				% Sign, must be guessed here
            dx = s*f*gamma*1e6 ./ (BW_per_pix);
            dX(j,i) = dx + shift;
            dX(j,i) = max(dX(j,i),-i+1);	% Sanity check
            dX(j,i) = min(dX(j,i),Ny-i);	% Sanity check
            X_uw(j,i) = X(j,i) + dX(j,i);
         end
         %unwarped_loc(j,i,:) = guess(:);
      end
   end
%% Try to fit dX and get dX_fit, a fitted version of dX with reasonable values over the whole FOV

% X2 = X.^2;
% Y2 = Y.^2;
% X3 = X.^3;
% Y3 = Y.^3;
% A = [ones(Nx*Ny,1) X(:) Y(:) X2(:) Y2(:) X(:).*Y(:) X3(:) Y3(:) X2(:).*Y(:) X(:).*Y2(:)];
% W = spalloc(Nx*Ny, Nx*Ny, Nx*Ny);
% tmp = abs(data(:,:,1,1,1));		% weight in fit
% tmp = tmp(:);				% Make it a vector
% W = spdiags(tmp, 0, W);                 % Place weights on diagonal
% dX_fit = zeros(Ny,Nx);
% 
% tmp2 = dX(:,:);
% Xvec = tmp2(:);
% c = (W*A)\(W*Xvec);
% tmp3 = zeros(Ny,Nx);
% tmp3(:) = A*c;
% dX_fit(:,:) = tmp3;
% % Re-obtain X_uw, this time using dX_fit instead of dX
% X_uw(:,:) = X + dX_fit(:,:);

%%
%X_uw = X_uw +5;
%% Apply the warping
result = zeros(size(data));
fprintf(1, 'Applying warping to the time frame #   ');
for t = 1:Nt
   fprintf(1, '\b\b%2d', t);
      for j = 1:Ny
         result(j,:,1,1,t) = spline(X(j,:), data(j,:,1,1,t), X_uw(j,:));
      end
end
fprintf(1, '\n');
