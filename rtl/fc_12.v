module fc_12(
    input wire clk,
    input wire rstn,
    input wire ivalid,
    input wire inputdata,
    input wire weight,
    output wire ovalid,
    output wire signed [9:0] dout
);
// reg w;

reg osign;
reg [9:0] cnt_fc;
reg inputdata_ff;

reg p;
reg signed [1:0] sum;
reg signed [9:0] dout_r;

reg ivalid_ff_0,ivalid_ff_1,ivalid_ff_2;

always @(posedge clk or negedge rstn)begin
    if(!rstn) begin
        cnt_fc <= 10'd0;
    end
    else begin
        if(cnt_fc == 10'd576)
            cnt_fc <= cnt_fc;
        else begin
            if(ivalid)
                cnt_fc <= cnt_fc + 1;
            else
                cnt_fc <= cnt_fc;
            end
    end
end

always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        ivalid_ff_0 <= 1'b0;
        ivalid_ff_1 <= 1'b0;
    end
    else begin
        ivalid_ff_0 <= ivalid;
        ivalid_ff_1 <= ivalid_ff_0;
        ivalid_ff_2 <= ivalid_ff_1;
     end
end


//-----------------count----------------------
always @(posedge clk or negedge rstn)begin
        if (!rstn)
            inputdata_ff <= 0;
        else
            inputdata_ff <= inputdata;
end
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        p <= 1'b0;
    end
    else begin
        if (ivalid_ff_0)
            p <= (weight ~^ inputdata_ff);
        else begin
            p <= p;
        end
    end
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        sum <= 2'sd0;
    end
    else begin
        if (ivalid_ff_1)begin
            if(p == 1'b1)
                sum <= 2'sd1;
            else
                sum <= -2'sd1;
            
        end
        else begin
            sum <= 2'sd0;  
            end
    end
             
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        dout_r <= 10'd0;
    end
    else begin
        if(ivalid_ff_2)begin
            dout_r <= sum + dout_r;
        end
        else begin
            dout_r <= dout_r;
        end
    end
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        osign <= 1'd0;
    end
    else begin
        if(!ivalid_ff_2)begin
            if (cnt_fc==10'd576)
                osign <= 1'd1;
            else
                osign <= 1'd0;
        end
        else begin
            osign <= osign;
        end
    end
end

assign dout = dout_r;
assign ovalid = osign;
endmodule