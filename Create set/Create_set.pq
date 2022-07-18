let
    YourFolder = "C:\Users\Steve\source\repos\cbind-in-Power-M\"
    ,Start = Expression.Evaluate(Text.FromBinary(File.Contents(YourFolder & "Cbind_map_data\Get_SVG_Data.pq")), #shared)
    
    
in
    Start
  