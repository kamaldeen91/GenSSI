function model = genssiTransposeModel(model)
    % genssiTransposeModel transposes all symbolic entries of the a GenSSI 
    % model. This function is necessary as different subroutines expect
    % currently different formats. This should be corrected in future
    % releases.
    %
    % Parameters:
    %  model: GenSSI model
    %
    % Return values:
    %  model: GenSSI model

    model.sym.p = transpose(model.sym.p);
    model.sym.x = transpose(model.sym.x);
    model.sym.x0 = transpose(model.sym.x0);
    model.sym.y = transpose(model.sym.y);
    if isfield(model.sym,'xdot')
        model.sym.xdot = transpose(model.sym.xdot);
    end
    if isfield(model.sym,'g')
        model.sym.g = transpose(model.sym.g);
    end
    if isfield(model.sym,'Par')
        model.sym.Par = transpose(model.sym.Par);
    end
    if isfield(model.sym,'xi_name')
        model.sym.xi_name = transpose(model.sym.xi_name);
    end
    if isfield(model.sym,'xi')
        model.sym.xi = transpose(model.sym.xi);
    end

end