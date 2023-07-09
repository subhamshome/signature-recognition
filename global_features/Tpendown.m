function Tpd = Tpendown(p)
    pen_downs = nnz(p);
    Tpd = pen_downs/size(p,2);
end

