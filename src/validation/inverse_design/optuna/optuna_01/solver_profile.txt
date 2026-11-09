$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2025
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/09/2026 10:46:42')
			I(1, 'Host', 'XGM-046057LN')
			I(1, 'Processor', '36')
			I(1, 'OS', 'Linux 7.0.0-42-generic')
			I(1, 'Product', 'HFSS Version 2025.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:03:23')
			I(1, 'ComEngine Memory', '154 M')
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(1, 0, \'Elapsed time : 00:00:00 , HFSS ComEngine Memory : 148 M\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Perform full validations with standard port validations\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 10:46:42')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:04')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('Mesh', 0, 0, 1, 0, 69000, 'I(4, 2, \'Tetrahedra\', 641, false, 1, \'Type\', \'TAU\', 2, \'Cores\', 4, false, 1, \'Band_Angle\', \'1.00000 deg\')', true, true)
			ProfileItem('Coarsen', 1, 0, 1, 0, 69000, 'I(2, 2, \'Tetrahedra\', 448, false, 1, \'Band_Angle\', \'1.00000 deg\')', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 73036, 'I(1, 2, \'Tetrahedra\', 456, false)', true, true)
			ProfileItem('Lambda Refine', 0, 0, 0, 0, 51916, 'I(1, 2, \'Tetrahedra\', 3272, false)', true, true)
			ProfileItem('Simulation Setup', 0, 0, 0, 0, 161188, 'I(2, 2, \'Tetrahedra\', 3272, false, 1, \'Disk\', \'0 Bytes\')', true, true)
			ProfileItem('Port Adapt', 0, 0, 0, 0, 162880, 'I(2, 2, \'Tetrahedra\', 3272, false, 1, \'Disk\', \'19.9 KB\')', true, true)
			ProfileItem('Port Refine', 0, 0, 0, 0, 51944, 'I(1, 2, \'Tetrahedra\', 3888, false)', true, true)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Adaptive Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 10:46:46')
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
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 164864, 'I(2, 2, \'Tetrahedra\', 3888, false, 1, \'Disk\', \'3.01 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 1, 0, 239212, 'I(4, 2, \'Tetrahedra\', 3888, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'341 KB\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 453860, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 23406, false, 3, \'Matrix bandwidth\', 42.4393, \'%5.1f\', 1, \'Disk\', \'92.2 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 0, 0, 453860, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.64 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 155412, 'I(1, 0, \'Adaptive Pass 1\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794232008')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.020591\', 1, \'Fbscputimesec\', \'0.041182\', 1, \'Fbsmemorytotalkb\', \'239240.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.276401\', 1, \'Factorizationmentotalkb\', \'159830.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2012\', 1, \'Factornnz\', \'3950733\', 1, \'Factorestflops\', \'3961107316\', 1, \'Fbsestflops\', \'27747060\', 1, \'Rootfactestflops\', \'2648889\', 1, \'Rootfbsestflops\', \'24964\', 1, \'Analysistimesec\', \'0.188990\', 1, \'Analysismemkb\', \'25080.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'239240\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'23406\', 1, \'Matrixbw\', \'42.738998\', 1, \'Matrixnnz\', \'1000348\', 1, \'Rootdim\', \'158\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 52060, 'I(1, 2, \'Tetrahedra\', 5049, false)', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 168036, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'3.01 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 1, 0, 263364, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'33 Bytes\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 3, 0, 565072, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 1, \'Disk\', \'120 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 1, 0, 565072, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.39 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 155420, 'I(1, 0, \'Adaptive Pass 2\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794232013')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.031882\', 1, \'Fbscputimesec\', \'0.063763\', 1, \'Fbsmemorytotalkb\', \'334176.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.402190\', 1, \'Factorizationmentotalkb\', \'229093.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2657\', 1, \'Factornnz\', \'5894700\', 1, \'Factorestflops\', \'6941900685\', 1, \'Fbsestflops\', \'41225956\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.277020\', 1, \'Analysismemkb\', \'32956.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'334176\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
				$end 'ProfileGroup'
				ProfileFootnote('I(1, 3, \'Max Mag. Delta S\', 0.00943807, \'%.5f\')', 0)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 0, \'Adaptive Passes converged\')', 0)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Frequency Sweep'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 10:46:56')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:03:09')
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
					I(1, 'Time', '11/09/2026 10:46:56')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(1, 'Elapsed Time', '00:03:09')
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231932, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 263028, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 342848, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'122 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 342848, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232029')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000550\', 1, \'Fbscputimesec\', \'0.000550\', 1, \'Fbsmemorytotalkb\', \'49052.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.866854\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.396197\', 1, \'Analysismemkb\', \'17228.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49052\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232220, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 264004, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 343412, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'122 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 343412, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232030')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000579\', 1, \'Fbscputimesec\', \'0.000579\', 1, \'Fbsmemorytotalkb\', \'49208.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.860647\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.383296\', 1, \'Analysismemkb\', \'17228.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49208\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232192, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264116, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 343804, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'122 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 343804, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232030')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000658\', 1, \'Fbscputimesec\', \'0.000658\', 1, \'Fbsmemorytotalkb\', \'49568.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.836911\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.399275\', 1, \'Analysismemkb\', \'17488.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49568\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234472, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 266372, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 343852, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'122 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 343852, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232031')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001110\', 1, \'Fbscputimesec\', \'0.001110\', 1, \'Fbsmemorytotalkb\', \'47724.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.843123\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.404594\', 1, \'Analysismemkb\', \'17584.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'47724\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 1, Frequency: 666200000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 2, Frequency: 187400000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 3, Frequency: 426800000000000Hz; S Matrix Error = 153.734%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 4, Frequency: 307100000000000Hz; S Matrix Error = 200.161%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 5, Frequency: 546500000000000Hz; S Matrix Error = 133.731%\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231508, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263308, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331280, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331280, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232060')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000806\', 1, \'Fbscputimesec\', \'0.000806\', 1, \'Fbsmemorytotalkb\', \'37512.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.819840\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.053790\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37512\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232636, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264292, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332236, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332236, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232061')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000961\', 1, \'Fbscputimesec\', \'0.000961\', 1, \'Fbsmemorytotalkb\', \'37688.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.832692\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.055929\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37688\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232136, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264040, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 334476, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 334476, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232061')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000940\', 1, \'Fbscputimesec\', \'0.000940\', 1, \'Fbsmemorytotalkb\', \'40096.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.832424\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.052972\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40096\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233180, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264916, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330500, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330500, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232061')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001036\', 1, \'Fbscputimesec\', \'0.001036\', 1, \'Fbsmemorytotalkb\', \'36192.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.825735\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.057094\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'36192\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 6, Frequency: 606350000000000Hz; S Matrix Error =  96.085%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 7, Frequency: 486650000000000Hz; S Matrix Error =  80.436%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 8, Frequency: 366950000000000Hz; S Matrix Error =  69.387%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 9, Frequency: 247250000000000Hz; S Matrix Error =  85.040%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 160596, 'I(1, 0, \'Frequency Group #2; Interpolating frequency sweep\')', true, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 236360, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 268152, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 335760, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 335760, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232092')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000747\', 1, \'Fbscputimesec\', \'0.000747\', 1, \'Fbsmemorytotalkb\', \'37740.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.842472\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.052989\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37740\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232204, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263960, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331780, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331780, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232092')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000552\', 1, \'Fbscputimesec\', \'0.000552\', 1, \'Fbsmemorytotalkb\', \'37240.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.848450\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.055752\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37240\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234096, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 266120, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 333732, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 333732, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232093')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000593\', 1, \'Fbscputimesec\', \'0.000593\', 1, \'Fbsmemorytotalkb\', \'37380.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.830221\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.055547\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37380\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 235036, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 266812, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332484, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332484, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232093')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001187\', 1, \'Fbscputimesec\', \'0.001187\', 1, \'Fbsmemorytotalkb\', \'36300.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.818579\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.054070\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'36300\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 10, Frequency: 277175000000000Hz; S Matrix Error =  80.658%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 11, Frequency: 217325000000000Hz; S Matrix Error =  66.110%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 12, Frequency: 337025000000000Hz; S Matrix Error =  43.816%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 13, Frequency: 396875000000000Hz; S Matrix Error =  11.569%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 160660, 'I(1, 0, \'Frequency Group #3; Interpolating frequency sweep\')', true, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234380, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 265692, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 333412, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 333412, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232124')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000754\', 1, \'Fbscputimesec\', \'0.000754\', 1, \'Fbsmemorytotalkb\', \'37296.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.832064\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.054616\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37296\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232520, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264280, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332100, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332100, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232124')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000978\', 1, \'Fbscputimesec\', \'0.000978\', 1, \'Fbsmemorytotalkb\', \'37532.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.828743\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.056605\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37532\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234728, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 266604, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 336520, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 336520, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232124')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001021\', 1, \'Fbscputimesec\', \'0.001021\', 1, \'Fbsmemorytotalkb\', \'40224.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.819129\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.054034\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40224\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234324, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 266312, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332116, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332116, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232124')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000505\', 1, \'Fbscputimesec\', \'0.000505\', 1, \'Fbsmemorytotalkb\', \'35860.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.801222\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.053488\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'35860\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 14, Frequency: 636275000000000Hz; S Matrix Error =   9.939%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 15, Frequency: 576425000000000Hz; S Matrix Error =   3.923%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 16, Frequency: 516575000000000Hz; S Matrix Error =   4.566%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 17, Frequency: 456725000000000Hz; S Matrix Error =   3.826%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 160720, 'I(1, 0, \'Frequency Group #4; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232524, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264372, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 334436, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 334436, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232153')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001103\', 1, \'Fbscputimesec\', \'0.001103\', 1, \'Fbsmemorytotalkb\', \'40392.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.900278\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.059038\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40392\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 235972, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 267740, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 337604, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 337604, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232154')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000631\', 1, \'Fbscputimesec\', \'0.000631\', 1, \'Fbsmemorytotalkb\', \'38984.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.920194\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.060481\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'38984\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232684, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 264444, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 332460, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332460, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232154')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000572\', 1, \'Fbscputimesec\', \'0.000572\', 1, \'Fbsmemorytotalkb\', \'38240.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.898578\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.057053\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'38240\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233324, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 265108, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 330888, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330888, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232155')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000748\', 1, \'Fbscputimesec\', \'0.000748\', 1, \'Fbsmemorytotalkb\', \'36600.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.966245\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.060063\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'36600\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 18, Frequency: 471687500000000Hz; S Matrix Error =   0.791%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 19, Frequency: 441762500000000Hz; S Matrix Error =   0.522%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 20, Frequency: 411837500000000Hz; S Matrix Error =   0.264%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 21, Frequency: 202362500000000Hz; S Matrix Error =   0.214%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 160772, 'I(1, 0, \'Frequency Group #5; Interpolating frequency sweep\')', true, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232628, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 263948, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 332244, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332244, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232187')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001005\', 1, \'Fbscputimesec\', \'0.001005\', 1, \'Fbsmemorytotalkb\', \'36300.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.926834\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.061074\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'36300\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:03')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232424, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 263752, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 332052, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332052, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232187')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000587\', 1, \'Fbscputimesec\', \'0.000587\', 1, \'Fbsmemorytotalkb\', \'37492.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.927095\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.060129\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37492\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 194881250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232528, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 264640, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 334400, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 334400, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232187')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000720\', 1, \'Fbscputimesec\', \'0.000720\', 1, \'Fbsmemorytotalkb\', \'40016.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.929898\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.061557\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40016\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 209843750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231608, 'I(2, 2, \'Tetrahedra\', 5049, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 1, 0, 1, 0, 263000, 'I(4, 2, \'Tetrahedra\', 5049, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 329416, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 30752, false, 3, \'Matrix bandwidth\', 42.8759, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329416, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794232188')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000651\', 1, \'Fbscputimesec\', \'0.000651\', 1, \'Fbsmemorytotalkb\', \'35064.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.891465\', 1, \'Factorizationmentotalkb\', \'31744.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2663\', 1, \'Factornnz\', \'5925744\', 1, \'Factorestflops\', \'7028697685\', 1, \'Fbsestflops\', \'41656528\', 1, \'Rootfactestflops\', \'11475864\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.061665\', 1, \'Analysismemkb\', \'17348.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'35064\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'30752\', 1, \'Matrixbw\', \'43.089199\', 1, \'Matrixnnz\', \'1325080\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 22, Frequency: 501612500000000Hz; S Matrix Error =   0.171%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 23, Frequency: 479168750000000Hz; Scattering matrix quantities converged; Passivity Error =   0.000253\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 24, Frequency: 194881250000000Hz; Scattering matrix quantities converged; Passive within tolerance\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 160940, 'I(1, 0, \'Frequency Group #6; Interpolating frequency sweep\')', true, true)
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
			ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:00\', 1, \'Total Memory\', \'148 MB\')', false, true)
			ProfileItem('Initial Meshing', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:04\', 1, \'Total Memory\', \'230 MB\')', false, true)
			ProfileItem('Adaptive Meshing', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:00:09\', 1, \'Average memory/process\', \'552 MB\', 1, \'Max memory/process\', \'552 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileItem('Frequency Sweep', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:03:09\', 1, \'Average memory/process\', \'327 MB\', 1, \'Max memory/process\', \'336 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileFootnote('I(3, 2, \'Max solved tets\', 5049, false, 2, \'Max matrix size\', 30752, false, 1, \'Matrix bandwidth\', \'42.9\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/09/2026 10:50:05\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
$end 'Profile'
