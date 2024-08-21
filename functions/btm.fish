which btm --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function btm --wraps="btm"
		log-t "Running" "btm" "with the GPU memory display enabled..."
		command btm --enable_gpu_memory $argv; 
	end
end
