function f=Sharma_Optimizer(X,Y, mad_values)
        X=X';
        Y=Y';

        l1_norm = norm(minus([Y(1,1) Y(1,3:4)],[X(1,1) X(1,3:4)])/[mad_values(1,1) mad_values(1,3:4)]); %use this for continuous features
        smc = simple_matching_counter([Y(1,2) Y(1,5:12)],[X(1,2) X(1,5:12)]); %use this for categorical features
        dist=l1_norm + smc;
    
        %if smc > 0
            %cost= 1/dist;
        %else
            %cost= 1/dist + 100;
        %end

        cost = 1/dist;

        f=cost;
end

