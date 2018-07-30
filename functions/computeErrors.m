function [ rmse , percision , recall , accuracy , fMeasure ] = computeErrors( data , output )
   %in the data input records should be in the columns and features should
   %be in rows

   [n , m] = size(data);
   squreError = sum(sum( (data - output).^2  , 1 ) , 2);
   rmse = sqrt((1/m) * squreError);
   
   tp = 0;
   tn = 0;
   fp = 0;
   fn = 0;
   
   for i = 1 : n
    for j = 1 : m
        if ((data(i , j) == 1) && (output(i , j) == 1))
            tp = tp + 1;
        elseif ((data(i , j) == 1) && (output(i , j) == 0))
            fn = fn + 1;
        elseif ((data(i , j) == 0) && (output(i , j) == 1))
            fp = fp + 1;
        elseif ((data(i , j) == 0) && (output(i , j) == 0))
            tn = tn + 1;
        end
    end
   end
   
   percision = tp / ( tp + fp );
   recall = tp / ( tp + fn );
   
   accuracy = ( tp + tn ) / ( tp + tn + fp + fn );
   
   if percision == 0 && recall == 0
    fMeasure = 0;
   else
    fMeasure = 2 *((percision * recall)/(percision + recall));
   end
end