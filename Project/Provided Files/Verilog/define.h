`define activehigh 1
`define activeedge posedge //if posedge activehigh should be 1, if negedge activehigh should be 0
`define procline posedge clk or `activeedge rst
`define proclineg posedge clk or `activeedge grst
`define proclineSlow posedge clkSlow or `activeedge rst
`define proclineFast posedge clkFast or `activeedge rst
`define proclinerclk posedge rclk or `activeedge rgrst
`define proclinewclk posedge wclk or `activeedge wgrst
`define grsttype "asynch"
