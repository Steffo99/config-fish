function stripbase
    for file in *
        set truename (string split -m1 " " "$file")[2]
        mv "$file" "$truename"
    end
end
