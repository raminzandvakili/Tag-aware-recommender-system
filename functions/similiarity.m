function simVec = similiarity( singleVec , groupOfVecs )
   % return a col vector that contains similiarity of singleVec with
   % groupOfVecs. singleVec must be a col vector and groupOfVecs a group of
   % col vectors.
   m = size(groupOfVecs , 2);
   simVec = zeros( m , 1 );
   for i = 1 : m
       if ( norm(groupOfVecs(: , i)) == 0 || norm(singleVec) == 0 )
           simVec(i , 1) = 0;
       else
           simVec(i , 1) = ( dot(groupOfVecs(: , i) , singleVec) ) / ( norm(groupOfVecs(: , i)) * norm(singleVec) );
       end
   end
end