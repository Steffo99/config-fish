which btm --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function btm --wraps="btm"
		command btm --enable_gpu_memory $argv; 
	end
end
