$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2025
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/09/2026 12:05:44')
			I(1, 'Host', 'XGM-046057LN')
			I(1, 'Processor', '36')
			I(1, 'OS', 'Linux 7.0.0-42-generic')
			I(1, 'Product', 'HFSS Version 2025.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:02:48')
			I(1, 'ComEngine Memory', '153 M')
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
			ProfileItem('Machine', 0, 0, 0, 0, 0, 'I(5, 1, \'Name\', \'XGM-046057LN\', 1, \'Memory\', \'62.4 GB\', 3, \'RAM Limit\', 90, \'%f%%\', 2, \'Cores\', 4, false, 1, \'Free Disk Space\', \'140 GB\')', false, true)
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Allow off core\', \'True\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Solution Basis Order\', \'1\')', false, true)
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(1, 0, \'Elapsed time : 00:00:00 , HFSS ComEngine Memory : 146 M\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Perform full validations with standard port validations\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 12:05:44')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:04')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('Mesh', 0, 0, 1, 0, 67000, 'I(4, 2, \'Tetrahedra\', 1089, false, 1, \'Type\', \'TAU\', 2, \'Cores\', 4, false, 1, \'Band_Angle\', \'1.00000 deg\')', true, true)
			ProfileItem('Coarsen', 1, 0, 1, 0, 68000, 'I(2, 2, \'Tetrahedra\', 506, false, 1, \'Band_Angle\', \'1.00000 deg\')', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 71240, 'I(1, 2, \'Tetrahedra\', 522, false)', true, true)
			ProfileItem('Lambda Refine', 0, 0, 0, 0, 52824, 'I(1, 2, \'Tetrahedra\', 3379, false)', true, true)
			ProfileItem('Simulation Setup', 0, 0, 0, 0, 158768, 'I(2, 2, \'Tetrahedra\', 3379, false, 1, \'Disk\', \'0 Bytes\')', true, true)
			ProfileItem('Port Adapt', 0, 0, 0, 0, 160332, 'I(2, 2, \'Tetrahedra\', 3379, false, 1, \'Disk\', \'19.9 KB\')', true, true)
			ProfileItem('Port Refine', 0, 0, 0, 0, 52856, 'I(1, 2, \'Tetrahedra\', 3997, false)', true, true)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Adaptive Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 12:05:49')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:16')
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
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 162800, 'I(2, 2, \'Tetrahedra\', 3997, false, 1, \'Disk\', \'3.02 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 0, 0, 237524, 'I(4, 2, \'Tetrahedra\', 3997, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'341 KB\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 448940, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 24090, false, 3, \'Matrix bandwidth\', 42.4961, \'%5.1f\', 1, \'Disk\', \'94.9 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 0, 0, 448940, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.65 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 153460, 'I(1, 0, \'Adaptive Pass 1\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794236750')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.021353\', 1, \'Fbscputimesec\', \'0.042706\', 1, \'Fbsmemorytotalkb\', \'235928.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.267379\', 1, \'Factorizationmentotalkb\', \'157758.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2073\', 1, \'Factornnz\', \'4113707\', 1, \'Factorestflops\', \'4083088931\', 1, \'Fbsestflops\', \'29027340\', 1, \'Rootfactestflops\', \'5195851\', 1, \'Rootfbsestflops\', \'39204\', 1, \'Analysistimesec\', \'0.164577\', 1, \'Analysismemkb\', \'24936.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'235928\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'24090\', 1, \'Matrixbw\', \'42.791401\', 1, \'Matrixnnz\', \'1030844\', 1, \'Rootdim\', \'198\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 52912, 'I(1, 2, \'Tetrahedra\', 4875, false)', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 165892, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'3.02 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 1, 0, 257116, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'63 Bytes\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 538340, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 1, \'Disk\', \'116 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 0, 0, 538340, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.36 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 153464, 'I(1, 0, \'Adaptive Pass 2\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794236758')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.029878\', 1, \'Fbscputimesec\', \'0.059756\', 1, \'Fbsmemorytotalkb\', \'313180.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.363552\', 1, \'Factorizationmentotalkb\', \'217360.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2567\', 1, \'Factornnz\', \'5642357\', 1, \'Factorestflops\', \'6452370630\', 1, \'Fbsestflops\', \'39918088\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.214427\', 1, \'Analysismemkb\', \'32380.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'313180\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
				$end 'ProfileGroup'
				ProfileFootnote('I(1, 3, \'Max Mag. Delta S\', 0.00490056, \'%.5f\')', 0)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 0, \'Adaptive Passes converged\')', 0)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Frequency Sweep'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 12:06:05')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:02:27')
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
					I(1, 'Time', '11/09/2026 12:06:05')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(1, 'Elapsed Time', '00:02:27')
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231472, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260800, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 334684, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'117 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 334684, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236777')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001023\', 1, \'Fbscputimesec\', \'0.001023\', 1, \'Fbsmemorytotalkb\', \'44092.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.664256\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.335355\', 1, \'Analysismemkb\', \'16593.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'44092\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230520, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259944, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 331368, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'117 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331368, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236778')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000578\', 1, \'Fbscputimesec\', \'0.000578\', 1, \'Fbsmemorytotalkb\', \'42696.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.678741\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.311996\', 1, \'Analysismemkb\', \'17328.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42696\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230152, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259604, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 330916, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'117 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330916, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236778')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000599\', 1, \'Fbscputimesec\', \'0.000599\', 1, \'Fbsmemorytotalkb\', \'42212.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.678436\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.311601\', 1, \'Analysismemkb\', \'17160.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42212\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #1\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230252, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259776, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 329092, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'117 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329092, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236778')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000444\', 1, \'Fbscputimesec\', \'0.000444\', 1, \'Fbsmemorytotalkb\', \'40332.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.635260\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.332130\', 1, \'Analysismemkb\', \'17380.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40332\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 1, Frequency: 666200000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 2, Frequency: 187400000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 3, Frequency: 426800000000000Hz; S Matrix Error = 182.316%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 4, Frequency: 307100000000000Hz; S Matrix Error = 116.682%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 5, Frequency: 546500000000000Hz; S Matrix Error =  67.376%\')', false, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 606350000000000Hz'
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229684, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259100, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 319964, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 319964, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236805')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000752\', 1, \'Fbscputimesec\', \'0.000752\', 1, \'Fbsmemorytotalkb\', \'31572.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.683545\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.046860\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31572\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232896, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262460, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 325196, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 325196, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236806')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000953\', 1, \'Fbscputimesec\', \'0.000953\', 1, \'Fbsmemorytotalkb\', \'33916.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.684578\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.048576\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'33916\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231068, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260416, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 321148, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 321148, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236806')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000558\', 1, \'Fbscputimesec\', \'0.000558\', 1, \'Fbsmemorytotalkb\', \'31952.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.664027\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.047003\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31952\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:01')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #2\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234840, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264264, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 323240, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 323240, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236807')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000988\', 1, \'Fbscputimesec\', \'0.000988\', 1, \'Fbsmemorytotalkb\', \'30192.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.673569\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.048280\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'30192\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 6, Frequency: 606350000000000Hz; S Matrix Error =  54.720%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 7, Frequency: 486650000000000Hz; S Matrix Error =  71.261%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 8, Frequency: 366950000000000Hz; S Matrix Error =  81.416%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 9, Frequency: 247250000000000Hz; S Matrix Error =  65.534%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 158800, 'I(1, 0, \'Frequency Group #2; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 277175000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229828, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259196, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 319940, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 319940, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236836')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000947\', 1, \'Fbscputimesec\', \'0.000947\', 1, \'Fbsmemorytotalkb\', \'32016.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.690908\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.045562\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'32016\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229940, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259292, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 320292, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 320292, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236836')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000754\', 1, \'Fbscputimesec\', \'0.000754\', 1, \'Fbsmemorytotalkb\', \'31472.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.696460\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.046511\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31472\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 217325000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231624, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261140, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 321884, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 321884, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236837')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001121\', 1, \'Fbscputimesec\', \'0.001121\', 1, \'Fbsmemorytotalkb\', \'31148.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.688248\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.046899\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31148\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232380, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261936, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 320808, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 320808, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236837')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000524\', 1, \'Fbscputimesec\', \'0.000524\', 1, \'Fbsmemorytotalkb\', \'29980.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.645118\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.047474\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'29980\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 10, Frequency: 277175000000000Hz; S Matrix Error =  70.043%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 11, Frequency: 396875000000000Hz; S Matrix Error =  42.204%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 12, Frequency: 217325000000000Hz; S Matrix Error =   9.195%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 13, Frequency: 337025000000000Hz; S Matrix Error =   2.089%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 158860, 'I(1, 0, \'Frequency Group #3; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 636275000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229984, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259372, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 320072, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 320072, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236865')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000585\', 1, \'Fbscputimesec\', \'0.000585\', 1, \'Fbsmemorytotalkb\', \'31496.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.683853\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.048114\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31496\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231036, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260668, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 321244, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 321244, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236865')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000940\', 1, \'Fbscputimesec\', \'0.000940\', 1, \'Fbsmemorytotalkb\', \'31816.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.672966\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.048151\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31816\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 516575000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232600, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262048, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 322596, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 322596, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236866')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000523\', 1, \'Fbscputimesec\', \'0.000523\', 1, \'Fbsmemorytotalkb\', \'31260.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.676650\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.051372\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31260\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231012, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260440, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 319460, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 319460, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236866')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001021\', 1, \'Fbscputimesec\', \'0.001021\', 1, \'Fbsmemorytotalkb\', \'30756.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.687716\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.047232\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'30756\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 14, Frequency: 636275000000000Hz; S Matrix Error =   1.679%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 15, Frequency: 576425000000000Hz; S Matrix Error =   0.223%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 16, Frequency: 516575000000000Hz; S Matrix Error =   0.228%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 17, Frequency: 456725000000000Hz; S Matrix Error =   0.396%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 158952, 'I(1, 0, \'Frequency Group #4; Interpolating frequency sweep\')', true, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229816, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259192, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 319984, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 319984, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236895')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000651\', 1, \'Fbscputimesec\', \'0.000651\', 1, \'Fbsmemorytotalkb\', \'31364.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.680734\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.054612\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31364\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 471687500000000Hz'
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230404, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259868, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 320728, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 320728, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236896')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000475\', 1, \'Fbscputimesec\', \'0.000475\', 1, \'Fbsmemorytotalkb\', \'31636.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.686830\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.047383\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31636\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 441762500000000Hz'
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230740, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260200, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 320808, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 320808, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236896')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000899\', 1, \'Fbscputimesec\', \'0.000899\', 1, \'Fbsmemorytotalkb\', \'31796.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.680448\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.047129\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'31796\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234652, 'I(2, 2, \'Tetrahedra\', 4875, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264088, 'I(4, 2, \'Tetrahedra\', 4875, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 322976, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 29638, false, 3, \'Matrix bandwidth\', 42.8539, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 322976, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794236896')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000477\', 1, \'Fbscputimesec\', \'0.000477\', 1, \'Fbsmemorytotalkb\', \'30116.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.674429\', 1, \'Factorizationmentotalkb\', \'26609.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2526\', 1, \'Factornnz\', \'5515869\', 1, \'Factorestflops\', \'6114421566\', 1, \'Fbsestflops\', \'38633412\', 1, \'Rootfactestflops\', \'10194397\', 1, \'Rootfbsestflops\', \'61504\', 1, \'Analysistimesec\', \'0.045093\', 1, \'Analysismemkb\', \'16708.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'30116\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'29638\', 1, \'Matrixbw\', \'43.060001\', 1, \'Matrixnnz\', \'1276212\', 1, \'Rootdim\', \'248\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 18, Frequency: 501612500000000Hz; S Matrix Error =   0.337%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 19, Frequency: 471687500000000Hz; S Matrix Error =   0.173%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 20, Frequency: 441762500000000Hz; Scattering matrix quantities converged; Passivity Error =   0.000789\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 21, Frequency: 531537500000000Hz; Scattering matrix quantities converged; Passive within tolerance\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 159080, 'I(1, 0, \'Frequency Group #5; Interpolating frequency sweep\')', true, true)
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
			ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:00\', 1, \'Total Memory\', \'146 MB\')', false, true)
			ProfileItem('Initial Meshing', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:04\', 1, \'Total Memory\', \'226 MB\')', false, true)
			ProfileItem('Adaptive Meshing', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:00:16\', 1, \'Average memory/process\', \'526 MB\', 1, \'Max memory/process\', \'526 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileItem('Frequency Sweep', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:02:27\', 1, \'Average memory/process\', \'316 MB\', 1, \'Max memory/process\', \'327 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileFootnote('I(3, 2, \'Max solved tets\', 4875, false, 2, \'Max matrix size\', 29638, false, 1, \'Matrix bandwidth\', \'42.9\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/09/2026 12:08:32\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
$end 'Profile'
