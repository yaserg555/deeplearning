function [X_new,y_new ] = sliding (X,slide, y)

[m,n]=size(X);


m_new=slide*m;
n_new=n/slide;
X_new = reshape(X.',m_new,n_new)';

%y_new=reshape(y,m_new,n_new)'
y_new=ones(m);

end
