/*module trace_parser;

  // Parameters to set default filename and debug mode
  string filename = "rwims.din"; // Default filename
  parameter bit debug = 1;       // Set to 1 to enable debug messages, 0 to disable

  // Variables for parsing
  int file;
  int operation;
  string address;

  // Initial block to open, read, and parse the file
  initial begin
    // Open the file for reading
    file = $fopen(filename, "r");
    if (file == 0) begin
      $display("Error: Could not open file %s", filename);
      $finish;
    end

    $display("Parsing file: %s", filename);

    // Read each line from the file
    while (!$feof(file)) begin
      // Read a line with format: operation address
      int status = $fscanf(file, "%d %s\n", operation, address);
      
      if (status == 2) begin
        // Output parsed values if debugging is enabled
        if (debug) begin
          $display("Parsed - Operation: %0d, Address: %s", operation, address);
        end
      end else begin
        $display("Error: Failed to parse line");
      end
    end

    // Close the file after reading
    $fclose(file);
    $display("Finished parsing file %s", filename);
  end

endmodule
*/
module trace_parser;

 
  string filename = "rwims.din"; // Default filename
  parameter bit debug = 1;//$fopen(filename, "r");;       // Set to 1 to enable debug messages, 0 to disable

 
  int file;
  int operation;
  string address;
  int status;
 
  // Initial block to open, read, and parse the file
  initial begin
    // Open the file for reading
    file = $fopen(filename, "r");
    if (file == 0) begin
      $display("Error: Could not open file %s", filename);
      //$finish;
    end
    else begin 
	$display("No error in the file %s",filename);
	

    $display("Parsing file: %s", filename);

    // Read each line from the file
    while (!$feof(file)) begin
      // Read a line with format: operation address
      status = $fscanf(file, "%d %s\n", operation, address);
      //c = status[0]
      if (status == 2) begin
        // Output parsed values if debugging is enabled
        if (operation)begin//debug) begin
          $display("Parsed - Operation: %0d, Address: %s", operation, address);
        end
      end else begin
        $display("Error: Failed to parse line");
      end
    end

    // Close the file after reading
    $fclose(file);
    $display("Finished parsing file %s", filename);
  end
end
endmodule




