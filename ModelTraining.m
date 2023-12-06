clc;
clear;
close all;

data = readtable("german_dataset.csv");

columns={'Target','Age_years_', 'ConcurrentCredits', 'CreditAmount','DurationOfCredit_month_', 'ForeignWorker','LengthOfCurrentEmployment', 'MostValuableAvailableAsset','PaymentStatusOfPreviousCredit', 'Purpose', 'Sex_MaritalStatus','TypeOfApartment', 'ValueSavings_Stocks'};


cols=columns(ismember(columns,data.Properties.VariableNames));
data=data(:,cols);

[n,m]=size(data);
rows=(1:n);


x=data(:,2:m);
y=data(:,1);
y=table2cell(y);

%xtrain=rows2vars(xtrain);
%train_data=table2cell(train_data);
y =categorical(y);
y = onehotencode(y, 2);
x=table2array(x);
x=x';
y=y';

trainFcn = 'trainscg';
hiddenLayerSize=[20,10,6];
net=patternnet(hiddenLayerSize, trainFcn);
net.divideParam.trainRatio=70/100;
net.divideParam.valRatio=15/100;
net.divideParam.testRatio=15/100;

[net,tr]= train(net,x,y );

ypred=net(x);

% Save the trained network
save('trainedModel.mat', 'net');