function [Number] = Hardware(WVec,Image)
Te = WVec*Image;
Te = Te == max(Te);
Number = find(Te) - 1;