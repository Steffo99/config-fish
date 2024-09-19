function seen_option_any
	for token in (commandline \
	--tokenize \
	--current-process)
		if contains \
	-- "$token" $argv
			return 0
		end
	end

    return 1
end

complete \
	--command='virtme-ng' \
	--short-option="h" \
	--long-option="help" \
	--exclusive \
	--description="Show help message and exit"

complete \
	--command='virtme-ng' \
	--short-option="V" \
	--long-option="version" \
	--exclusive \
	--description="Show program's version and exit" \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option="dry-run" \
	--description="Only show the commands without actually running them" \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option="no-virtme-ng-init" \
	--description="Fallback to the bash virtme-init" \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='gdb' \
	--description='Attach a debugging session to running instance' \
	--condition='__fish_seen_argument -l debug' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='snaps' \
	--description='Allow to execute snaps inside virtme-ng' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='debug' \
	--description='Start the instance with debugging enabled' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='skip-modules' \
	--short-option='S' \
	--description='Skip external modules' \
	--condition='__fish_seen_argument -s b -l build' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='commit' \
	--short-option='c' \
	--description='Use a kernel identified by a specific commit id, tag or branch' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='config' \
	--short-option='f' \
	--condition='__fish_seen_argument -s b -l build' \
	--description='Use specific kernel .config override file'

complete \
	--command='virtme-ng' \
	--long-option='configitem' \
	--description='Override a single .config item' \
	--condition='__fish_seen_argument -s b -l build' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='busybox' \
	--description='Use the specified busybox binary'

complete \
	--command='virtme-ng' \
	--long-option='qemu' \
	--description='Use the specified QEMU binary' \
	--condition='__fish_seen_argument -s r -l run'

complete \
	--command='virtme-ng' \
	--long-option='name' \
	--description='Set guest hostname' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='user' \
	--description='Change user inside the guest' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files \
	--arguments='(__fish_complete_users)'

complete \
	--command='virtme-ng' \
	--long-option='root' \
	--description='Pass a specific chroot to use inside the virtualized kernel' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files \
	--arguments='(__fish_complete_directories .)'

complete \
	--command='virtme-ng' \
	--long-option='root-release' \
	--description='Use a target Ubuntu release to create a new chroot' \
	--condition='__fish_seen_argument -l root' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='rw' \
	--description='Give the guest read-write access to its root filesystem' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='force-9p' \
	--description='Use legacy 9p filesystem as rootfs' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='disable-microvm' \
	--description='Avoid using the "microvm" QEMU architecture (only on x86_64)' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='disable-kvm' \
	--description='Avoid using hardware virtualization / KVM' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='cwd' \
	--description='Change guest working directory' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files \
	--arguments='(__fish_complete_directories .)'

complete \
	--command='virtme-ng' \
	--long-option='rodir' \
	--description='Supply a read-only directory to the guest' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files \
	--arguments='(__fish_complete_directories .)'

complete \
	--command='virtme-ng' \
	--long-option='rwdir' \
	--description='Supply a read/write directory to the guest' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files \
	--arguments='(__fish_complete_directories .)'

complete \
	--command='virtme-ng' \
	--long-option='overlay-rwdir' \
	--description='Supply a directory that is r/w to the guest but read-only in the host' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files \
	--arguments='(__fish_complete_directories .)'

complete \
	--command='virtme-ng' \
	--long-option='cpus' \
	--short-option='p' \
	--description='Set guest CPU count' \
	--condition='__fish_seen_argument -s r -l run'

complete \
	--command='virtme-ng' \
	--long-option='memory' \
	--short-option='m' \
	--description='Set guest memory size' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='numa' \
	--description='Create a NUMA node in the guest' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='balloon' \
	--description='Allow the host to ask the guest to release memory' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='network' \
	--short-option='n' \
	--description='Enable network access' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='disk' \
	--short-option='D' \
	--description='Add a file as virtio-scsi disk' \
	--condition='__fish_seen_argument -s r -l run'

complete \
	--command='virtme-ng' \
	--long-option='exec' \
	--short-option='e' \
	--description='Execute a command inside the kernel and exit' \
	--condition='__fish_seen_argument -s r -l run'

complete \
	--command='virtme-ng' \
	--long-option='append' \
	--short-option='a' \
	--description='Additional kernel boot options' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='force-initramfs' \
	--description='Use an initramfs even if unnecessary' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='sound' \
	--description='Enable audio device' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='graphics' \
	--short-option='g' \
	--description='Show graphical output instead of using a console' \
	--condition='__fish_seen_argument -s r -l run' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='verbose' \
	--short-option='v' \
	--description='Increase console output verbosity' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='quiet' \
	--short-option='q' \
	--description='Decrease console output verbosity' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='qemu-opts' \
	--short-option='o' \
	--description='Additional arguments for QEMU' \
	--condition='__fish_seen_argument -s r -l run'

complete \
	--command='virtme-ng' \
	--long-option='build-host' \
	--description='Perform kernel build on a remote server' \
	--condition='__fish_seen_argument -s b -l build' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='build-host-exec-prefix' \
	--description='Prepend a command to the make command executed on the remote build host' \
	--condition='__fish_seen_argument -l build-host'

complete \
	--command='virtme-ng' \
	--long-option='build-host-vmlinux' \
	--description='Copy vmlinux back from the build host' \
	--condition='__fish_seen_argument -l build-host' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='arch' \
	--description='Generate and test a kernel for a specific architecture' \
	--condition='__fish_seen_argument -s r -l run -s b -l build' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='cross-compile' \
	--description='Set cross-compile prefix' \
	--condition='__fish_seen_argument -s b -l build'

complete \
	--command='virtme-ng' \
	--long-option='force' \
	--description='Force reset git repository to target branch or commit and force kernel config override' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='kconfig' \
	--short-option='k' \
	--description='Only override the kernel .config without building/running anything'

complete \
	--command='virtme-ng' \
	--long-option='run' \
	--short-option='r' \
	--description='Run a specific kernel'

complete \
	--command='virtme-ng' \
	--long-option='build' \
	--short-option='b' \
	--description='Build the kernel in the current directory (or remotely if used with \
	--build-host)' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='clean' \
	--short-option='x' \
	--description='Clean the kernel repository (local or remote if used with \
	--build-host)' \
	--no-files

complete \
	--command='virtme-ng' \
	--long-option='dump' \
	--short-option='d' \
	--description='Generate a memory dump of the running kernel' \
	--no-files

