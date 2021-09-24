Attributes[ShowSteps] = {HoldAll}
 
ShowSteps[exp_] := WolframAlpha[ToString[HoldForm[InputForm[exp]]], 
     TimeConstraint -> Infinity, IncludePods -> 
      {"Input", "Indefinite Integral", "Root", "Result"}, 
     PodStates -> {"Step-by-step solution", "Show all steps"}]
