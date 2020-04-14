function tester= teste()
   n = 10000000;
   a = 10;
   parfor (i=1:n,4)
       a = i;
   end
   tester = a;
end