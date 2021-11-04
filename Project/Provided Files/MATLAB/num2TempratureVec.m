function Vec = num2TempratureVec(num)
if num>9 || num <0
    num=9;
end
Vec = zeros(1,10);Vec(num+1) = 1;