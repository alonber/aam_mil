function note = MakeNote(n, T, dt)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    f0 = 440;
    tau = 0.4;
    t = (0 : dt : T)';
    
    fn = (2^(n/12))*f0;
    note = cos(2*pi*fn*t).*exp(-t./tau);

    
end