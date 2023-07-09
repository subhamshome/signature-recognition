function Npu = Npenups(p)
    V = find(p == 0);
    assignin("base","V",V);
    counts = 1;
    for i=1:(size(V,2)-1)
        if((V(i+1) - V(i)) > 1)
            counts = counts + 1;
        end
    end
    Npu = counts;
end

