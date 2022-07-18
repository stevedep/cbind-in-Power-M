let    
    DeCompress = (s, cols) =>
    Table.FromRows(
      Json.Document(
        Binary.Decompress(Binary.FromText(s, BinaryEncoding.Base64), Compression.Deflate)
      ), 
      Expression.Evaluate(cols)
    ),
   //working with compressed data string
   // Source = Xml.Tables(File.Contents("C:\Users\310267217\map.svg")),
    polygon = DeCompress("ZZlBst0qDES3QmXsAWDAeC2p7H8bv09L3HeTP0ihd8G2BK1Wo/z+/Wv2erVVd5mtY9Qy67jafHsZY8vYo4yqNfNZ5d5MrV3uZ2HUci/WzC6DNbfWTL1Hby33YHEd5b61eGw91TeGpvjoWJrio2PqKT46Ri39ZfHdS98sbksGi+VYf7RYLpS+tFgulD61WC6Ujqv6sgwt1pdLv1ncNdVZ3DTVWCx/etVifUeGFuv1pb1arNeXRoB6a2kEqLeWRoB6qwwW91EaAeodpRGg3lEaAeodpRGg3iFDi/VoaQSoR0sjQD1aiE8PFMLTskJ0MgrBVTlFbFWbRWhVvhFZlWsEVgebqFH7o3EzXa/N7L623NZDW77qHfv2K7f81Be2vNQHH7mm7z84Jn8euYODzwiPH20XITxyh5iW3CHIJXeIerFD2obFBmlfFtuijVp37Nxid7SVq8XeAis2G1Sx+4CK4wBTnA+Q4sBmnqBHhQCwPHKgimVyngoGeIGGybEqHKNMcQi6RpLBpjgO1gw1+T/kN7A04uS/ASf/xwgkgzugDexu+T96YB70Dfmvf0X2BQg1d90kh/wHiyQJUNQ3YpR//p2RdXvHc2fU/vM76cY6xeLnFOsFkhW7RmWh/ALQ2rsLPGsvLyVSWXxf8WvvNeqotU+ge/F9xa+zusD2o33RHgkD9QLiOtsYda4g/TPyu/bF60auV9z+XXELGxcYf4C//H5IDPn9kDLye5NDC5Bt6KNs0k1+b3Arv3ekaNngWn5v8A7sA//lJUHk96vvye1Xn/saZky26mzAWJ4gMy5QWYEBf2tbyVZgDSqBNagEth45bn7nmEF5rX4OOC7QP4B/IfcvCAG4bWeD3WrmJxwwmTk/ggZIlO3ImknxZvE2mZUWxKnFoMYsMEZsF6Tn/WsAx5QBMkwiQMO0MjkjiAZwcChw7xUcpE/02+nIuUFP+kQQlj5hClvaK45W36s+66aENghaoEKLfbyv+a4aP40DBlCNEwZhbSfkGmcKBhuHCijbBnUEyHEC27bBNwF+jFdbB8K/jNZzqudT773SWDuncMOL30gU7ch25vSaqRjGhGvkIcndRYxpyEPSvos6zQMdpEAMHWgM2B+qgzI6HDddIfRRSKXDYmYZ6Mu0Y76Ch0xUEJOZCaYyFUFd5iI4DRIKkruT9aAd0yAgMS/ehyhhFpizQylQaQcbcGsHG2tAjtpMWLdTnBcBwhvwcQcba5swt5m6gw2ou8MZDwGCDUhdLusXAgQb0H0HEg8BQhhPEG11ZehQwEOAcAU1wwZFx1NvzcUvb9brr9dvFthskCCegoK9mN3YOGajj29Daza7gWF/mLKHPwb++Czq/42oXh0eCGPnFMYbVT9dNYfgocqpDBaPmoaO4PVTGGwC0HqJHbC9zwocviQs1Pe3QcqwRjjaxzhTP4amSHOMZuIwt5o5vizoxSRiy3nsWSdyWM5kz5LKVIK0RgqcsIC2WaGBt7ZQEC7twKIBECZksY66E5bln2e/rZrPflm8z7PWbrYsljxb/TV5RYrDRFEZgK43ADBDQrjvooTPx6g5Rf2xrKQAWWhSgX6MHfI0DB1WTK2sWmRrPE4dxW8bODazwv5tzDcXezNsHJkbBvX5fH0ex+Zxddp55fivP9fvX41cyfO71zld1sbZkxyGw8fQqkAKBqToqZmUbMOIIzXrj7ETsODUMB8H+MhBy13RiWngx1BOmCH6oQp0mqfuFIJfBolYM1nDmPke6M288mXszFoZkdmailzHgKigCjsG94TRehIMsvQ5tLS8ONnI1DUPmY1Db/chPD7KwdkNjskezuOzifM9VLqtPHcwqOkWTgXwZllT8rRK3cHEpu1xiBy2ZhPWITMzOvQfHM8nqktETfW7Uv66jBCgBfE6pYYA0SiuMIgW1xzEuKsQKt11CZ3jSmUBdFjN1Yxzd31zMSRAsBE1EFELf1BUw9hROcOYWW8RxmHULMXUWxXn0LRRrvfIAh7GmfoYlFk/ZUl2pMFrsRAauSEKXeQtKKwaRk0dgeg4mLfWsDA5JGk9QoJYoVCFrFmoZlYxljzmuLmuJMUQwiGUniOd1hFT88ircQTXOBIMnQVarLwoxdZioCWugXyiHnFHgJT00HRQynMkIQFaLS7LxtSGFpLjSMv7iM2e6tMa01dfAvRFt6ZgJT7ydaeg3Slwnx4MTGwIYEIzclYIY/9Oyu0Qzn5ztUCv30YUlFDhjHHftVT32OJ3zjVutCn5nx5XgLniSmDC17o7rwy5O74ywOhv6F0O2FeOlVeQEVvukaLAoVAlzrji/DzunH+jinjsIWmhEF+R3oCLr0pcoUAfVypkbVYEX7laiFFfvbiS7UAp6LiT8X2FuyMvZotEASJcGc8IUnyVFBY9IkX5fUVCwDIx1rhi3jmPmmU98vbucQUdNa6kXFlJzBndmLjS7rjicrXlyjsj73311T5YhPpqHFRhdcrVuYXItWyFXeSv6WanwoW0VvRdzFAr5S1XczgMCnuj5xLatgftcaeCB4+whTthSloCI7otcKlbBtlridZCCFigaxWR1QV57tYE9cetih2tC4Rq9lge0g5Iyw+FQcFRFDRBqDEIie4GCaXw6e6T7Bo9lj6i5+LL7wX83ZOh5wKg6cEA8Go1M6JZE20dZ2bNQu7Wj9N4RaPH7SHnvKUcLGB1t0c2lWrNNlPd2XjK/knruVvuQEW7asZ+Wki4pQWXucnlTpbbXnVkI8wFb2X/y80yK/yePTLCc9eM+NxHcwbLsWjD1ZqNOe1itOr6yOYdnRK380bgK7p4ZrBEYHT6LJPAnBVUr9k6pD94xNU4cstXYWuqmu1FNyWBmqWUDTcTWWO5da8UYH1/Gzu+Ffqt11R0pLrF3l+GdWA/EtHGjim3OPjEY59nMFToyWO47THd90gjpp7zFLrU73mP0K35CVIgqHEcVewOhgX1+ohnEsLHgTQJkf2vNc66cSR1tBU8O6PiOJ32sUBQXAJ6NmfjOhD1kPdFw+DLSvDl9eL0FTxrfTtT1nEwpN1n5EbH7z3mYTV+h9XoSsJqZCswoC8JLshmgEJ230/c5CwkW2CLICy3AN0I9rDqonEHy9GjHnEtZ91pTBt3KxuGT7LhTnZ8o0EwUhuZbWf4CcrNxrAv7Hwn62e8jCtZmj1jHfvEcygQ3kPVIUmoQrwfZTuyMTdbNOAMtjsanlS7c+HxVYi4s8qhW/kddmQd++LLeY8GH/vl6zvvy8buk41eX/SpatbR4R/7TjWEPTlVzmPNOB9OnvMiLs7Phw1svOjOh0a+BCmuzedhvxyNvqLU4oQ/Rqnd4aSdwemaQbQMqmeQPUrBZ+SQs3u5spvpKyTr2SRUTY33zQzWl7xUxz4MvceHs8N/DsOHt/Iw5/oZKZ1672e8o9PkUq31I583OAAP73mjW8z3AJPB9kbX+k5Jb/Dlf5sYrJ8xGkYGeYvfKZ2+ZGSpN+gpnXtH0rQAK/vJ99ln/GH/8e/ZkXyc088YSUc8HgERv6/6zxjrfv358x8=", "type table [ap = text]"),
    //polygon = Source{0}[polygon],
    spl = Table.TransformColumns(polygon, {"ap",  Splitter.SplitTextByDelimiter(" ", QuoteStyle.Csv)}),
    //input for the cbind function
    input =  List.Transform(spl[ap], each Table.FromList(_,
                                                     Splitter.SplitByNothing())), //normally splits columns by comma separation, we don't want this)),   
    
    // each list of points (ap) is transformed into a table with an index column. 

    totbl  = Table.TransformColumns(spl, { // interate each row of the table               
                "ap", //we works with column ap, ap is the list with points
                    (x) => //the anonomous function thats executed per row
                      //  Table.AddIndexColumn(
                        Table.FromList(x, // we transform into a table 
                                                    Splitter.SplitByNothing()) //normally splits columns by comma separation, we don't want this
                                     //       , "Index") // name of the index column
                }),
    
    AddRowCountAndPrefix = (listoftables) =>
        let
            AddIndex = List.Transform(listoftables, each Table.AddIndexColumn(_,"Index")), //Add Index Key to each datapoint
            //AddIndexColToTable = Table
            //first column (original list, holds the XY positions, so we rename this column
            RenameCol = List.Transform(AddIndex, each Table.RenameColumns(_,{{"Column1", "xy"}})),
                    //each table with points had a empty record 
            RemoveExptyRows = List.Transform(RenameCol, each Table.SelectRows(_, each [xy] <> "") ),
            ToTable = Table.FromList(RemoveExptyRows,Splitter.SplitByNothing()),
            // Name the dataset
            Added_Index = Table.AddIndexColumn(ToTable, "ColName", 0, 1),
            Changed_Type = Table.TransformColumnTypes(Added_Index,{{"ColName", type text}}),
            prefix = Table.TransformColumns(Changed_Type,{{"ColName", each "svg_data_" & _ & "_"}}),
    
            // get the max index per pointset
            max = Table.AddColumn(prefix, "m",  each List.Max(_[Column1][Index])) 
    in max,
    Result = AddRowCountAndPrefix(input)
in
  Result
 //Result[Column1]{0}
   
