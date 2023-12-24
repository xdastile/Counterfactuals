function f=Similarity(X,Y, mad_values)
        l1_norm = norm(minus(Y,X)/mad_values);
        dist=l1_norm;
        f=dist;
end