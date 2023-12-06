function f=Sparsity(A,B)

    a=sum(A==B);
    
    epsilon=2;
    idx =find(abs(A-B) < epsilon ); %which variables have a minimu change
    b=length(idx);

    c= abs(a-b)/length(A);

    
    %b=(1/length(idx)) * sum((A(idx) - B(idx)).^2);
     d=a/length(A);

    f = d + c;
    %f=a;
end