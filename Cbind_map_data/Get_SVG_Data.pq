let    
    Source = Xml.Tables(File.Contents("C:\Users\310267217\map.svg")),
    polygon = Source{0}[polygon],
    spl = Table.TransformColumns(polygon, {"Attribute:points",  Splitter.SplitTextByDelimiter(" ", QuoteStyle.Csv)}),
    rename = Table.RenameColumns(spl, {{"Attribute:points", "ap"}}), // so we can work in VS
    // each list of points (ap) is transformed into a table with an index column. 
    totbl  = Table.TransformColumns(rename, { // interate each row of the table               
                "ap", //we works with column ap, ap is the list with points
                    (x) => //the anonomous function thats executed per row
                        Table.AddIndexColumn(Table.FromList(x, // we transform into a table 
                                                    Splitter.SplitByNothing()) //normally splits columns by comma separation, we don't want this
                                            , "Index") // name of the index column
                }),
            //first column (original list, holds the XY positions, so we rename this column
    renamecol1 = Table.TransformColumns(totbl, {{"ap", each Table.RenameColumns(_,{{"Column1", "xy"}})}} ),
            //each table with points had a empty record 
    removeempty = Table.TransformColumns(renamecol1, {{"ap", each Table.SelectRows(_, each [xy] <> "")}} ),
    
    // Name the pointset
    Added_Index = Table.AddIndexColumn(removeempty, "ColName", 0, 1),
    Changed_Type = Table.TransformColumnTypes(Added_Index,{{"ColName", type text}}),
    prefix = Table.TransformColumns(Changed_Type,{{"ColName", each "svg_data_" & _ & "_"}}),
    
    // get the max index per pointset
    max = Table.AddColumn(prefix, "m",  each List.Max(_[ap][Index])),
    
    //clear up
    Removed_Columns = Table.RemoveColumns(max,{"Attribute:style"})  
    

    
in
    Removed_Columns
