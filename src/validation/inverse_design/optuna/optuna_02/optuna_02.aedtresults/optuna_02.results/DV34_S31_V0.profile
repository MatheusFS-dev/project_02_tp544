$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2025
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/09/2026 10:50:12')
			I(1, 'Host', 'XGM-046057LN')
			I(1, 'Processor', '36')
			I(1, 'OS', 'Linux 7.0.0-42-generic')
			I(1, 'Product', 'HFSS Version 2025.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:05:38')
			I(1, 'ComEngine Memory', '156 M')
		$end 'TotalInfo'
		GroupOptions=8
		TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Executing From\', \'/usr/local/AnsysEM25R2/v252/AnsysEM/HFSSCOMENGINE.exe\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='HPC'
			$begin 'StartInfo'
				I(1, 'Type', 'Auto')
				I(1, 'MPI Vendor', 'Intel')
				I(1, 'MPI Version', '2021')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, ' ')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions(Memory=8)
			ProfileItem('Machine', 0, 0, 0, 0, 0, 'I(5, 1, \'Name\', \'XGM-046057LN\', 1, \'Memory\', \'62.4 GB\', 3, \'RAM Limit\', 90, \'%f%%\', 2, \'Cores\', 4, false, 1, \'Free Disk Space\', \'155 GB\')', false, true)
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Allow off core\', \'True\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Solution Basis Order\', \'1\')', false, true)
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(1, 0, \'Elapsed time : 00:00:00 , HFSS ComEngine Memory : 150 M\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Perform full validations with standard port validations\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 10:50:12')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:04')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('Mesh', 0, 0, 0, 0, 56760, 'I(2, 1, \'Type\', \'Phi\', 2, \'Tetrahedra\', 337, false)', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 58136, 'I(1, 2, \'Tetrahedra\', 361, false)', true, true)
			ProfileItem('Lambda Refine', 0, 0, 0, 0, 53792, 'I(1, 2, \'Tetrahedra\', 3720, false)', true, true)
			ProfileItem('Simulation Setup', 0, 0, 0, 0, 159904, 'I(2, 2, \'Tetrahedra\', 3720, false, 1, \'Disk\', \'0 Bytes\')', true, true)
			ProfileItem('Port Adapt', 0, 0, 0, 0, 161596, 'I(2, 2, \'Tetrahedra\', 3720, false, 1, \'Disk\', \'19.9 KB\')', true, true)
			ProfileItem('Port Refine', 0, 0, 0, 0, 53816, 'I(1, 2, \'Tetrahedra\', 4302, false)', true, true)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Adaptive Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 10:50:16')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:09')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			$begin 'ProfileGroup'
				MajorVer=2025
				MinorVer=2
				Name='Adaptive Pass 1'
				$begin 'StartInfo'
					I(1, 'Frequency', '666200000000000Hz')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 163488, 'I(2, 2, \'Tetrahedra\', 4302, false, 1, \'Disk\', \'5.11 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 1, 0, 244208, 'I(4, 2, \'Tetrahedra\', 4302, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'340 KB\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 3, 0, 535464, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 26018, false, 3, \'Matrix bandwidth\', 42.7546, \'%5.1f\', 1, \'Disk\', \'102 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 1, 0, 535464, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.68 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 156840, 'I(1, 0, \'Adaptive Pass 1\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794232218')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.027889\', 1, \'Fbscputimesec\', \'0.055777\', 1, \'Fbsmemorytotalkb\', \'318620.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.414538\', 1, \'Factorizationmentotalkb\', \'212654.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2240\', 1, \'Factornnz\', \'5179259\', 1, \'Factorestflops\', \'6988415129\', 1, \'Fbsestflops\', \'36282772\', 1, \'Rootfactestflops\', \'21461668\', 1, \'Rootfbsestflops\', \'101124\', 1, \'Analysistimesec\', \'0.222180\', 1, \'Analysismemkb\', \'27852.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'318620\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'26018\', 1, \'Matrixbw\', \'42.885502\', 1, \'Matrixnnz\', \'1115796\', 1, \'Rootdim\', \'318\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
				$end 'ProfileGroup'
			$end 'ProfileGroup'
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2025
				MinorVer=2
				Name='Adaptive Pass 2'
				$begin 'StartInfo'
					I(1, 'Frequency', '666200000000000Hz')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(0, ' ')
				$end 'TotalInfo'
				GroupOptions=0
				TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 53872, 'I(1, 2, \'Tetrahedra\', 5223, false)', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 165756, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'5.11 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 1, 0, 263120, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, true)
				ProfileItem('Matrix Solve', 1, 0, 3, 0, 634268, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 1, \'Disk\', \'124 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 1, 0, 634268, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.37 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 156844, 'I(1, 0, \'Adaptive Pass 2\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794232223')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.037977\', 1, \'Fbscputimesec\', \'0.075955\', 1, \'Fbsmemorytotalkb\', \'404700.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.505509\', 1, \'Factorizationmentotalkb\', \'279133.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2742\', 1, \'Factornnz\', \'6835105\', 1, \'Factorestflops\', \'10018499358\', 1, \'Fbsestflops\', \'47920352\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.290228\', 1, \'Analysismemkb\', \'34040.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'404700\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
				$end 'ProfileGroup'
				ProfileFootnote('I(1, 3, \'Max Mag. Delta S\', 0.00495223, \'%.5f\')', 0)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 0, \'Adaptive Passes converged\')', 0)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Frequency Sweep'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 10:50:25')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:05:25')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'HPC\', \'Enabled\')', false, true)
			$begin 'ProfileGroup'
				MajorVer=2025
				MinorVer=2
				Name='Solution - Varredura'
				$begin 'StartInfo'
					I(0, 'Interpolating HFSS Frequency Sweep, Solving Distributed - up to 4 frequencies in parallel')
					I(1, 'Time', '11/09/2026 10:50:25')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(1, 'Elapsed Time', '00:05:25')
				$end 'TotalInfo'
				GroupOptions=4
				TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'From 187400000000000Hz to 666200000000000Hz, 401 Frequencies\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Frequency: 666200000000000Hz has already been solved\')', false, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 187400000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234612, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 265948, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 361176, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'126 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 361176, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232240')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000995\', 1, \'Fbscputimesec\', \'0.000995\', 1, \'Fbsmemorytotalkb\', \'63828.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.134010\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.421197\', 1, \'Analysismemkb\', \'17846.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'63828\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 426800000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234360, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 265704, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 358776, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'126 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 358776, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232240')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000901\', 1, \'Fbscputimesec\', \'0.000901\', 1, \'Fbsmemorytotalkb\', \'61172.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.132550\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.424395\', 1, \'Analysismemkb\', \'17846.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'61172\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 307100000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230696, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261468, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 356844, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'126 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 356844, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232241')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000959\', 1, \'Fbscputimesec\', \'0.000959\', 1, \'Fbsmemorytotalkb\', \'63492.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.135810\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.426930\', 1, \'Analysismemkb\', \'17846.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'63492\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 546500000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233388, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 264848, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 356216, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'126 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 356216, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232241')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001628\', 1, \'Fbscputimesec\', \'0.001628\', 1, \'Fbsmemorytotalkb\', \'60756.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.162390\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.443670\', 1, \'Analysismemkb\', \'18588.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'60756\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 1, Frequency: 666200000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 2, Frequency: 187400000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 3, Frequency: 426800000000000Hz; S Matrix Error = 152.102%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 4, Frequency: 307100000000000Hz; S Matrix Error =  56.368%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 5, Frequency: 546500000000000Hz; S Matrix Error =  20.735%\')', false, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 606350000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231304, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262624, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 345156, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 345156, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232272')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001428\', 1, \'Fbscputimesec\', \'0.001428\', 1, \'Fbsmemorytotalkb\', \'51724.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.117920\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.062748\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51724\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 486650000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233392, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264820, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 349184, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 349184, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232273')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001022\', 1, \'Fbscputimesec\', \'0.001022\', 1, \'Fbsmemorytotalkb\', \'53396.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.143910\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.063644\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'53396\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 366950000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231952, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263428, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 345792, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 345792, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232273')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000974\', 1, \'Fbscputimesec\', \'0.000974\', 1, \'Fbsmemorytotalkb\', \'52096.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.123810\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.063757\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'52096\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 247250000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230528, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 261644, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 342812, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 342812, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232274')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000918\', 1, \'Fbscputimesec\', \'0.000918\', 1, \'Fbsmemorytotalkb\', \'49472.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.119570\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.065555\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49472\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 6, Frequency: 606350000000000Hz; S Matrix Error =  38.369%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 7, Frequency: 486650000000000Hz; S Matrix Error =  53.906%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 8, Frequency: 366950000000000Hz; S Matrix Error = 138.300%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 9, Frequency: 247250000000000Hz; S Matrix Error =  95.116%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161976, 'I(1, 0, \'Frequency Group #2; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 217325000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230708, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262000, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 344436, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 344436, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232305')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001040\', 1, \'Fbscputimesec\', \'0.001040\', 1, \'Fbsmemorytotalkb\', \'51640.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.117730\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.062588\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51640\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 396875000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231960, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263136, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 345580, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 345580, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232305')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000905\', 1, \'Fbscputimesec\', \'0.000905\', 1, \'Fbsmemorytotalkb\', \'51624.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.131810\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.063883\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51624\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 277175000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233700, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 265092, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 347532, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 347532, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232306')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001068\', 1, \'Fbscputimesec\', \'0.001068\', 1, \'Fbsmemorytotalkb\', \'51788.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.121480\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.066588\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51788\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 337025000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232888, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264184, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 344668, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 344668, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232306')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001050\', 1, \'Fbscputimesec\', \'0.001050\', 1, \'Fbsmemorytotalkb\', \'49120.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.120450\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.064308\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49120\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 10, Frequency: 217325000000000Hz; S Matrix Error =  24.718%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 11, Frequency: 396875000000000Hz; S Matrix Error =  15.677%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 12, Frequency: 277175000000000Hz; S Matrix Error =  50.212%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 13, Frequency: 337025000000000Hz; S Matrix Error =  46.924%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162036, 'I(1, 0, \'Frequency Group #3; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 516575000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230036, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 261344, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 344136, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 344136, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232338')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000961\', 1, \'Fbscputimesec\', \'0.000961\', 1, \'Fbsmemorytotalkb\', \'50960.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.143970\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.063737\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'50960\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 456725000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231340, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 262640, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 344400, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 344400, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232338')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000948\', 1, \'Fbscputimesec\', \'0.000948\', 1, \'Fbsmemorytotalkb\', \'50484.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.175290\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.065385\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'50484\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 636275000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232996, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264448, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 348764, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 348764, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232339')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001174\', 1, \'Fbscputimesec\', \'0.001174\', 1, \'Fbsmemorytotalkb\', \'53152.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.154870\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.064903\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'53152\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 576425000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231136, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 262544, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 342832, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 342832, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232339')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001043\', 1, \'Fbscputimesec\', \'0.001043\', 1, \'Fbsmemorytotalkb\', \'49400.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.148820\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.070725\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49400\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 14, Frequency: 516575000000000Hz; S Matrix Error =  20.107%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 15, Frequency: 456725000000000Hz; S Matrix Error =  14.808%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 16, Frequency: 636275000000000Hz; S Matrix Error =  11.869%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 17, Frequency: 576425000000000Hz; S Matrix Error =   6.247%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162104, 'I(1, 0, \'Frequency Group #4; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 351987500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229772, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260608, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 345288, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 345288, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232371')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001097\', 1, \'Fbscputimesec\', \'0.001097\', 1, \'Fbsmemorytotalkb\', \'52488.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.168500\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.064604\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'52488\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 322062500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233012, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264332, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 346604, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 346604, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232371')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001041\', 1, \'Fbscputimesec\', \'0.001041\', 1, \'Fbsmemorytotalkb\', \'50732.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.174430\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.065575\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'50732\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 292137500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231540, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 262860, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 344940, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 344940, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232372')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000971\', 1, \'Fbscputimesec\', \'0.000971\', 1, \'Fbsmemorytotalkb\', \'51332.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.184170\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.067221\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51332\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 381912500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229756, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 261064, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 341372, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 341372, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232372')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000999\', 1, \'Fbscputimesec\', \'0.000999\', 1, \'Fbsmemorytotalkb\', \'47876.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.131880\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.067911\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'47876\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 18, Frequency: 351987500000000Hz; S Matrix Error =   4.112%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 19, Frequency: 322062500000000Hz; S Matrix Error =   2.707%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 20, Frequency: 292137500000000Hz; S Matrix Error =   2.390%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 21, Frequency: 381912500000000Hz; S Matrix Error =   2.900%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162152, 'I(1, 0, \'Frequency Group #5; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 441762500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 235060, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 265848, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 348008, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 348008, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232404')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000996\', 1, \'Fbscputimesec\', \'0.000996\', 1, \'Fbsmemorytotalkb\', \'51012.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.144150\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.067553\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51012\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 411837500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233384, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 264752, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 349116, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 349116, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232405')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001269\', 1, \'Fbscputimesec\', \'0.001269\', 1, \'Fbsmemorytotalkb\', \'53140.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.124860\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.063668\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'53140\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 314581250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233500, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 265084, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 347660, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 347660, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232405')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001082\', 1, \'Fbscputimesec\', \'0.001082\', 1, \'Fbsmemorytotalkb\', \'52008.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.136550\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.064480\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'52008\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 389393750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230640, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 261672, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 342084, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 342084, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232406')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000921\', 1, \'Fbscputimesec\', \'0.000921\', 1, \'Fbsmemorytotalkb\', \'48612.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.144100\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.065357\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'48612\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 22, Frequency: 441762500000000Hz; S Matrix Error =   2.295%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 23, Frequency: 411837500000000Hz; S Matrix Error =   1.278%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 24, Frequency: 314581250000000Hz; S Matrix Error =   1.857%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 25, Frequency: 389393750000000Hz; S Matrix Error =   1.218%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162240, 'I(1, 0, \'Frequency Group #6; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 471687500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233276, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264556, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 346836, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 346836, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232436')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001350\', 1, \'Fbscputimesec\', \'0.001350\', 1, \'Fbsmemorytotalkb\', \'51696.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.062850\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.060642\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51696\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 202362500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231280, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262792, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 344952, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 344952, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232437')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001334\', 1, \'Fbscputimesec\', \'0.001334\', 1, \'Fbsmemorytotalkb\', \'51172.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.067110\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.060745\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51172\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 419318750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231428, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262868, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 345132, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 345132, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232437')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001019\', 1, \'Fbscputimesec\', \'0.001019\', 1, \'Fbsmemorytotalkb\', \'51440.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.064640\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.058773\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51440\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 262212500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231056, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262488, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 342696, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 342696, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232438')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001008\', 1, \'Fbscputimesec\', \'0.001008\', 1, \'Fbsmemorytotalkb\', \'49064.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.095530\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.058124\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49064\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 26, Frequency: 471687500000000Hz; S Matrix Error =   0.627%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 27, Frequency: 202362500000000Hz; S Matrix Error =   0.601%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 28, Frequency: 419318750000000Hz; S Matrix Error =   0.883%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 29, Frequency: 262212500000000Hz; S Matrix Error =   0.473%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162304, 'I(1, 0, \'Frequency Group #7; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 501612500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230224, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261512, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 343912, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 343912, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232468')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001406\', 1, \'Fbscputimesec\', \'0.001406\', 1, \'Fbsmemorytotalkb\', \'51020.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.052440\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.092445\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51020\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 434281250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233904, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 265316, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 349924, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 349924, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232469')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001489\', 1, \'Fbscputimesec\', \'0.001489\', 1, \'Fbsmemorytotalkb\', \'53944.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.049820\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.088358\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'53944\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 464206250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231812, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263052, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 347800, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 347800, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232469')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001098\', 1, \'Fbscputimesec\', \'0.001098\', 1, \'Fbsmemorytotalkb\', \'54176.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.041600\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.086065\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'54176\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 449243750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229840, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261160, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 341624, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 341624, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232470')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000743\', 1, \'Fbscputimesec\', \'0.000743\', 1, \'Fbsmemorytotalkb\', \'48432.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.049650\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.063314\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'48432\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 30, Frequency: 501612500000000Hz; S Matrix Error =   0.274%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 31, Frequency: 434281250000000Hz; S Matrix Error =   0.194%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 32, Frequency: 464206250000000Hz; S Matrix Error =   0.195%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 33, Frequency: 449243750000000Hz; S Matrix Error =   0.177%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163288, 'I(1, 0, \'Frequency Group #8; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 509093750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #9\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230544, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262140, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 344412, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 344412, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232500')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000874\', 1, \'Fbscputimesec\', \'0.000874\', 1, \'Fbsmemorytotalkb\', \'50992.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.097010\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.059053\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'50992\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 531537500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #9\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231680, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262920, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 345208, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 345208, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232501')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000982\', 1, \'Fbscputimesec\', \'0.000982\', 1, \'Fbsmemorytotalkb\', \'51256.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.069580\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.063111\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51256\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 479168750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #9\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231448, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262912, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 345200, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 345200, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232501')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001071\', 1, \'Fbscputimesec\', \'0.001071\', 1, \'Fbsmemorytotalkb\', \'51388.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.068520\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.058920\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51388\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 651237500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #9\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231460, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262576, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 342908, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 342908, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232501')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000874\', 1, \'Fbscputimesec\', \'0.000874\', 1, \'Fbsmemorytotalkb\', \'49372.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.048540\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.057116\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49372\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 34, Frequency: 509093750000000Hz; S Matrix Error =   0.216%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 35, Frequency: 531537500000000Hz; S Matrix Error =   0.123%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 36, Frequency: 479168750000000Hz; S Matrix Error =   0.122%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 37, Frequency: 651237500000000Hz; S Matrix Error =   0.124%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163372, 'I(1, 0, \'Frequency Group #9; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 299618750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #10\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232788, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264060, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 346360, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 346360, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232532')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000938\', 1, \'Fbscputimesec\', \'0.000938\', 1, \'Fbsmemorytotalkb\', \'51112.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.058740\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.060655\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51112\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 232287500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #10\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233504, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264748, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 349228, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 349228, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232533')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001046\', 1, \'Fbscputimesec\', \'0.001046\', 1, \'Fbsmemorytotalkb\', \'53312.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.076240\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.073386\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'53312\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 658718750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #10\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231364, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262752, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 344652, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 344652, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232533')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000791\', 1, \'Fbscputimesec\', \'0.000791\', 1, \'Fbsmemorytotalkb\', \'51016.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.053640\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.059885\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'51016\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 643756250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #10\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233648, 'I(2, 2, \'Tetrahedra\', 5223, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 265068, 'I(4, 2, \'Tetrahedra\', 5223, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 345592, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 31846, false, 3, \'Matrix bandwidth\', 43.0118, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 345592, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232534')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001081\', 1, \'Fbscputimesec\', \'0.001081\', 1, \'Fbsmemorytotalkb\', \'49808.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'1.042670\', 1, \'Factorizationmentotalkb\', \'43946.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2758\', 1, \'Factornnz\', \'6722861\', 1, \'Factorestflops\', \'9499400462\', 1, \'Fbsestflops\', \'47403920\', 1, \'Rootfactestflops\', \'23552378\', 1, \'Rootfbsestflops\', \'107584\', 1, \'Analysistimesec\', \'0.059425\', 1, \'Analysismemkb\', \'17970.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49808\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'31846\', 1, \'Matrixbw\', \'43.105598\', 1, \'Matrixnnz\', \'1372740\', 1, \'Rootdim\', \'328\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 38, Frequency: 299618750000000Hz; Scattering matrix quantities converged; Passivity Error =   0.008274\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 39, Frequency: 232287500000000Hz; Scattering matrix quantities converged; Passive within tolerance\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163488, 'I(1, 0, \'Frequency Group #10; Interpolating frequency sweep\')', true, true)
				ProfileFootnote('I(1, 0, \'Interpolating sweep converged and is passive\')', 0)
				ProfileFootnote('I(1, 0, \'HFSS: Distributed Interpolating sweep\')', 0)
			$end 'ProfileGroup'
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Simulation Summary'
			$begin 'StartInfo'
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(0, ' ')
			$end 'TotalInfo'
			GroupOptions=0
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:00\', 1, \'Total Memory\', \'150 MB\')', false, true)
			ProfileItem('Initial Meshing', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:04\', 1, \'Total Memory\', \'215 MB\')', false, true)
			ProfileItem('Adaptive Meshing', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:00:09\', 1, \'Average memory/process\', \'619 MB\', 1, \'Max memory/process\', \'619 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileItem('Frequency Sweep', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:05:25\', 1, \'Average memory/process\', \'339 MB\', 1, \'Max memory/process\', \'353 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileFootnote('I(3, 2, \'Max solved tets\', 5223, false, 2, \'Max matrix size\', 31846, false, 1, \'Matrix bandwidth\', \'43.0\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/09/2026 10:55:50\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
$end 'Profile'
