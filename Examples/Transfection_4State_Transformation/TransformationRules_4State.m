function transDef = TransformationRules_4State()
    % TransformationRules_4State defines a state transformation and a 
    % parameter substitution for the 4-state model for mRNA transfection 
    % introduced by
    % 
    %    Lechtenberg, L. (2015). Model selection in deterministic models of
    %    mRNA transfection. Master Thesis, Ludwig-Maximilians-Universitaet,
    %    Munich, Germany.
    %
    % The state transformation reduces the number of state variable by
    % exploiting the conservation relations. The parameter substitution
    % reduced the number of parameters by on, improving the
    % identifiability.

    % Symbolic variables in model
    syms mRNA GFP enz mRNAenz
    syms d1 d2 d3 b kTL mRNA0 enz0

    % Definition of conservation relations
    % (Note: These constraints are set to zeros and used to reduce the
    % dimension of the state space.)
    transDef.sym.constraint = [enz-enz0+mRNAenz];

    % Definition of new state variables
    transDef.sym.state.formula = [mRNA/mRNA0
                                  GFP
                                  enz/mRNA0];
%     transDef.sym.state.name   = {'rel_mRNA';...
%                                  'GFP';...
%                                  'rel_enz'};
    
    % Definition of new state variables
    transDef.sym.parameter.formula = [d1 
                                      d2*mRNA0
                                      d3
                                      b
                                      kTL*mRNA0
                                      enz0/mRNA0];
%     transDef.sym.parameter.name   = {'d1';...
%                                      'd2t_times_mRNA0';...
%                                      'd3';...
%                                      'b';...
%                                      'kTLt_times_RNA0';...
%                                      'enz0_div_mRNA0'};
end