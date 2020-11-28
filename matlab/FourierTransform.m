function Xf = FourierTransform (x, t, w)
    F = exp(1i*t*w');
    Xf = (F')*x*(t(2) - t(1));
end