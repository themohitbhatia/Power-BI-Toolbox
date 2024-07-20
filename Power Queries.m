// 1. DYNAMIC QUERY TO CHECK WHEATHER CELL IS NULL OR NOT FOR ALL SPECIFIED COLUMNS

let
     = SOURCE HERE,
    
    // List of columns to apply the custom column logic
    columnsToCheck = {
        COLUMNS HERE
    },

    // Function to add custom columns based on null check
    addCustomColumns = (table as table, columns as list) as table =>
        List.Accumulate(
            columns,
            table,
            (state, currentColumn) => Table.AddColumn(
                state,
                currentColumn & " null",
                each if Record.Field(_, currentColumn) = null then "null" else "value"
            )
        ),

    // Apply the function to add custom columns
    ResultTable = addCustomColumns(Source, columnsToCheck)
in
    ResultTable