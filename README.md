# synthesize-it
> [!NOTE]
> I don't know if I'll ever start this project. For now, it's just an idea. Feel free to contribute if you're interested.

See the results of synthesizing various RTL patterns on synthesis tools.
These results allow tracking differences across synthesis tools.

# Example: Register
Original RTL code:
```systemverilog
module foo(
  input logic clk, rst, in,
  output logic out
);

always_ff @(posedge clk, posedge rst) begin
  if (rst)
    out <= '0;
  else
    out <= in;
end
endmodule
```
Output for this particular snippet:
| Tool | Result | Command |
| - | - | - |
| Intel Quartus Prime Lite | Register | `quartus_map ...` |
| Xilinx Vivado | Register | `xilinx synthesize...` |
| Yosys | Register | `yosys synth...` | 
| BadSynthTool | Latch | `badtool synth...` |

# To Do
- [ ] Get several examples
  - [ ] `always` block
    - [ ] blocking assignment
    - [ ] non-blocking assignment
    - [ ] mixture
  - [ ] `always_comb` block
    - [ ] (same as above)
  - [ ] `always_ff` block
    - [ ] (same as above)
- [ ] Create a script that runs various synthesis tools
  - [ ] parse results to better understand what was synthesized (may be difficult for non-trivial designs)
- [ ] Support multiple versions of each synthesizer/simulator
- [ ] multiple languages? Probably won't make a difference, but it doesn't hurt to test!
