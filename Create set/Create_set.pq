let
    YourFolder = "C:\Users\310267217\source\repos\"
    ,Start = Expression.Evaluate(Text.FromBinary(File.Contents(YourFolder & "Cbind_map_data\Cbind_map_data\Get_SVG_Data.pq")), #shared),
    
    // Get max of the different point lengths
    max = List.Max(Start[m]),
    //generate a list that will represent our main column to which we will cbind the others
    l = List.Generate(()=>0, each _ < max, each _ + 1 ),
    
    
    Index_ConvertToTable = Table.FromColumns({l}, 
                            type table[ Index = Int64.Type ]),
    
    //Convert to Table with our pointsets to a list, also contains the name of the set! (second column)
        TableRows = Table.ToRows(Start)
        , // we will iterate TableRows, to current will reflect to row being interated,
        //Index_ConvertToTable reflects the first state
        JoinTables = List.Accumulate(TableRows,Index_ConvertToTable,(state,current) => 
        let
            Joined = Table.NestedJoin(state,{"Index"},current{0},{"Index"},"JoinedTableColumn",JoinKind.LeftOuter),
            ColumnNames1 = List.Difference(Table.ColumnNames(current{0}),{"Index"}), //All Column names other than index
            ColumnNames2 = List.Transform( ColumnNames1, each (current{1}) & _) , //All these columns with a prefix, being the name of the dataset
            Expanded = Table.ExpandTableColumn(Joined,"JoinedTableColumn",ColumnNames1, ColumnNames2) //These columns exanded and renames to the prefix name
        in
            Expanded //The joined dataset becomes the new state.
            ),
    #"Changed Type" = Table.TransformColumnTypes(JoinTables,{{"Index", Int64.Type}}),
    #"Sorted Rows" = Table.Sort(#"Changed Type",{{"Index", Order.Ascending}})
    
in
    JoinTables
  //TableRows{0}
 //   Table.NestedJoin(Index_ConvertToTable,{"Index"},TableRows{0}{0},{"Index"},"JoinedTableColumn",JoinKind.LeftOuter)
    //Table.NestedJoin(Index_ConvertToTable,{"Index"},TableRows{1}{0},{"Index"},"JoinedTableColumn",JoinKind.LeftOuter)[JoinedTableColumn]{0}
   //Table.NestedJoin(Index_ConvertToTable,{"Index"},TableRows{2}{0},{"Index"},"JoinedTableColumn",JoinKind.LeftOuter)
 // List.Difference(Table.ColumnNames(TableRows{1}{0}),{"Index"}) // Yields xy as column name
//  List.Transform( List.Difference(Table.ColumnNames(TableRows{2}{0}),{"Index"}), each (TableRows{2}{1}) & _)