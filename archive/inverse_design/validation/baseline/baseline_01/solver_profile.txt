$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2025
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/09/2026 09:22:46')
			I(1, 'Host', 'XGM-046057LN')
			I(1, 'Processor', '36')
			I(1, 'OS', 'Linux 7.0.0-42-generic')
			I(1, 'Product', 'HFSS Version 2025.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:06:09')
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
			ProfileItem('Machine', 0, 0, 0, 0, 0, 'I(5, 1, \'Name\', \'XGM-046057LN\', 1, \'Memory\', \'62.4 GB\', 3, \'RAM Limit\', 90, \'%f%%\', 2, \'Cores\', 4, false, 1, \'Free Disk Space\', \'158 GB\')', false, true)
		$end 'ProfileGroup'
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Allow off core\', \'True\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 1, \'Solution Basis Order\', \'1\')', false, true)
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(1, 0, \'Elapsed time : 00:00:00 , HFSS ComEngine Memory : 149 M\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Perform full validations with standard port validations\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 09:22:47')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:04')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('Mesh', 0, 0, 1, 0, 72000, 'I(4, 2, \'Tetrahedra\', 1744, false, 1, \'Type\', \'TAU\', 2, \'Cores\', 4, false, 1, \'Band_Angle\', \'1.00000 deg\')', true, true)
			ProfileItem('Coarsen', 1, 0, 1, 0, 73000, 'I(2, 2, \'Tetrahedra\', 805, false, 1, \'Band_Angle\', \'1.00000 deg\')', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 75912, 'I(1, 2, \'Tetrahedra\', 839, false)', true, true)
			ProfileItem('Lambda Refine', 0, 0, 0, 0, 52720, 'I(1, 2, \'Tetrahedra\', 3525, false)', true, true)
			ProfileItem('Simulation Setup', 0, 0, 0, 0, 162440, 'I(2, 2, \'Tetrahedra\', 3525, false, 1, \'Disk\', \'0 Bytes\')', true, true)
			ProfileItem('Port Adapt', 0, 0, 0, 0, 164452, 'I(2, 2, \'Tetrahedra\', 3525, false, 1, \'Disk\', \'19.9 KB\')', true, true)
			ProfileItem('Port Refine', 0, 0, 0, 0, 52748, 'I(1, 2, \'Tetrahedra\', 4113, false)', true, true)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Adaptive Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 09:22:51')
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
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 165900, 'I(2, 2, \'Tetrahedra\', 4113, false, 1, \'Disk\', \'3.02 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 0, 0, 243752, 'I(4, 2, \'Tetrahedra\', 4113, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'341 KB\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 464600, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 24846, false, 3, \'Matrix bandwidth\', 42.5848, \'%5.1f\', 1, \'Disk\', \'97.9 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 0, 0, 464600, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.66 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 156224, 'I(1, 0, \'Adaptive Pass 1\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794226972')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.020103\', 1, \'Fbscputimesec\', \'0.040206\', 1, \'Fbsmemorytotalkb\', \'246892.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.288255\', 1, \'Factorizationmentotalkb\', \'169015.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2112\', 1, \'Factornnz\', \'4287277\', 1, \'Factorestflops\', \'4447226420\', 1, \'Fbsestflops\', \'29790020\', 1, \'Rootfactestflops\', \'11470712\', 1, \'Rootfbsestflops\', \'66564\', 1, \'Analysistimesec\', \'0.173703\', 1, \'Analysismemkb\', \'26532.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'246892\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'24846\', 1, \'Matrixbw\', \'42.772400\', 1, \'Matrixnnz\', \'1062724\', 1, \'Rootdim\', \'258\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 52804, 'I(1, 2, \'Tetrahedra\', 4700, false)', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 168036, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'3.02 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 1, 0, 256824, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 538092, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 1, \'Disk\', \'112 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 0, 0, 538092, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.32 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 156228, 'I(1, 0, \'Adaptive Pass 2\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794226977')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.029267\', 1, \'Fbscputimesec\', \'0.058534\', 1, \'Fbsmemorytotalkb\', \'311968.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.360514\', 1, \'Factorizationmentotalkb\', \'211608.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2460\', 1, \'Factornnz\', \'5433459\', 1, \'Factorestflops\', \'6567743988\', 1, \'Fbsestflops\', \'38118948\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.202643\', 1, \'Analysismemkb\', \'31188.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'311968\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
				$end 'ProfileGroup'
				ProfileFootnote('I(1, 3, \'Max Mag. Delta S\', 0.00275699, \'%.5f\')', 0)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 0, \'Adaptive Passes converged\')', 0)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Frequency Sweep'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 09:23:00')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:05:56')
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
					I(1, 'Time', '11/09/2026 09:23:00')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(1, 'Elapsed Time', '00:05:56')
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232936, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262304, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 340980, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'113 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 340980, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794226993')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000753\', 1, \'Fbscputimesec\', \'0.000753\', 1, \'Fbsmemorytotalkb\', \'49892.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.730489\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.326445\', 1, \'Analysismemkb\', \'15953.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'49892\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231376, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260956, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 339632, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'113 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 339632, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794226994')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000793\', 1, \'Fbscputimesec\', \'0.000793\', 1, \'Fbsmemorytotalkb\', \'50148.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.730721\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.327962\', 1, \'Analysismemkb\', \'15953.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'50148\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231780, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261204, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 339884, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'113 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 339884, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794226994')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000729\', 1, \'Fbscputimesec\', \'0.000729\', 1, \'Fbsmemorytotalkb\', \'50596.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.711638\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.326618\', 1, \'Analysismemkb\', \'16104.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'50596\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230420, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259764, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 336436, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'113 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 336436, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794226995')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000780\', 1, \'Fbscputimesec\', \'0.000780\', 1, \'Fbsmemorytotalkb\', \'47328.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.662341\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.330226\', 1, \'Analysismemkb\', \'15953.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'47328\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 1, Frequency: 666200000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 2, Frequency: 187400000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 3, Frequency: 426800000000000Hz; S Matrix Error = 131.287%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 4, Frequency: 307100000000000Hz; S Matrix Error = 126.483%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 5, Frequency: 546500000000000Hz; S Matrix Error =  55.183%\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232244, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261680, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329724, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329724, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227023')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000801\', 1, \'Fbscputimesec\', \'0.000801\', 1, \'Fbsmemorytotalkb\', \'40148.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.714380\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.045561\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40148\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 235508, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 265016, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332780, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332780, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227024')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000744\', 1, \'Fbscputimesec\', \'0.000744\', 1, \'Fbsmemorytotalkb\', \'40564.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.720416\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.046458\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40564\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234564, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263932, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331976, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331976, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227024')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001436\', 1, \'Fbscputimesec\', \'0.001436\', 1, \'Fbsmemorytotalkb\', \'40164.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.705340\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.047228\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40164\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234888, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263656, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329320, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329320, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227025')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001336\', 1, \'Fbscputimesec\', \'0.001336\', 1, \'Fbsmemorytotalkb\', \'37544.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.623001\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.050254\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37544\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 6, Frequency: 606350000000000Hz; S Matrix Error =  61.614%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 7, Frequency: 486650000000000Hz; S Matrix Error =  72.582%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 8, Frequency: 366950000000000Hz; S Matrix Error =  63.951%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 9, Frequency: 247250000000000Hz; S Matrix Error =  75.288%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161416, 'I(1, 0, \'Frequency Group #2; Interpolating frequency sweep\')', true, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232016, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261384, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331260, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331260, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227053')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000928\', 1, \'Fbscputimesec\', \'0.000928\', 1, \'Fbsmemorytotalkb\', \'42428.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.666433\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043427\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42428\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232448, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261932, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330044, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330044, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227053')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000566\', 1, \'Fbscputimesec\', \'0.000566\', 1, \'Fbsmemorytotalkb\', \'39952.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.675599\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043991\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39952\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232340, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261680, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331792, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331792, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227054')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000950\', 1, \'Fbscputimesec\', \'0.000950\', 1, \'Fbsmemorytotalkb\', \'41932.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.643255\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044189\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41932\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234520, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263824, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329476, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329476, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227054')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001078\', 1, \'Fbscputimesec\', \'0.001078\', 1, \'Fbsmemorytotalkb\', \'37848.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.623638\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043254\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37848\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 10, Frequency: 277175000000000Hz; S Matrix Error =  50.785%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 11, Frequency: 217325000000000Hz; S Matrix Error =  38.041%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 12, Frequency: 337025000000000Hz; S Matrix Error =  25.853%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 13, Frequency: 396875000000000Hz; S Matrix Error =  24.554%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161480, 'I(1, 0, \'Frequency Group #3; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233476, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262916, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330976, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330976, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227083')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000670\', 1, \'Fbscputimesec\', \'0.000670\', 1, \'Fbsmemorytotalkb\', \'39896.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.678726\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.041682\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39896\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234444, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263824, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331816, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331816, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227083')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001357\', 1, \'Fbscputimesec\', \'0.001357\', 1, \'Fbsmemorytotalkb\', \'39732.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.684868\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044454\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39732\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233948, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263416, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331824, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331824, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227084')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001424\', 1, \'Fbscputimesec\', \'0.001424\', 1, \'Fbsmemorytotalkb\', \'39984.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.647216\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044501\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39984\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232188, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261588, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 327344, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 327344, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227084')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001327\', 1, \'Fbscputimesec\', \'0.001327\', 1, \'Fbsmemorytotalkb\', \'37772.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.628989\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043105\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37772\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 14, Frequency: 576425000000000Hz; S Matrix Error =  23.613%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 15, Frequency: 636275000000000Hz; S Matrix Error =   9.899%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 16, Frequency: 411837500000000Hz; S Matrix Error =   8.382%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 17, Frequency: 516575000000000Hz; S Matrix Error =   2.421%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161568, 'I(1, 0, \'Frequency Group #4; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232080, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261560, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329844, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329844, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227112')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001443\', 1, \'Fbscputimesec\', \'0.001443\', 1, \'Fbsmemorytotalkb\', \'40564.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.665907\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044035\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40564\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234976, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264356, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 334504, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 334504, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227113')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000770\', 1, \'Fbscputimesec\', \'0.000770\', 1, \'Fbsmemorytotalkb\', \'42320.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.672853\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.047857\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42320\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232268, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261660, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329688, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329688, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227113')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001412\', 1, \'Fbscputimesec\', \'0.001412\', 1, \'Fbsmemorytotalkb\', \'40012.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.665927\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044876\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40012\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232804, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262100, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 327876, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 327876, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227113')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000830\', 1, \'Fbscputimesec\', \'0.000830\', 1, \'Fbsmemorytotalkb\', \'38036.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.631131\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044311\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'38036\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 18, Frequency: 456725000000000Hz; S Matrix Error =   3.365%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 19, Frequency: 531537500000000Hz; S Matrix Error =   2.457%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 20, Frequency: 501612500000000Hz; S Matrix Error =   1.619%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 21, Frequency: 202362500000000Hz; S Matrix Error =   1.065%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161616, 'I(1, 0, \'Frequency Group #5; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232304, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261716, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329864, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329864, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227140')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000972\', 1, \'Fbscputimesec\', \'0.000972\', 1, \'Fbsmemorytotalkb\', \'40400.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.660151\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043120\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40400\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234464, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263972, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332268, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332268, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227141')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001398\', 1, \'Fbscputimesec\', \'0.001398\', 1, \'Fbsmemorytotalkb\', \'40216.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.662827\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.042759\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40216\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232140, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261756, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329872, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329872, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227141')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000691\', 1, \'Fbscputimesec\', \'0.000691\', 1, \'Fbsmemorytotalkb\', \'40096.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.655294\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043872\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40096\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232744, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261908, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 328024, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 328024, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227142')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001297\', 1, \'Fbscputimesec\', \'0.001297\', 1, \'Fbsmemorytotalkb\', \'38276.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.652270\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043897\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'38276\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 22, Frequency: 381912500000000Hz; S Matrix Error =   2.013%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 23, Frequency: 441762500000000Hz; S Matrix Error =   1.782%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 24, Frequency: 194881250000000Hz; S Matrix Error =   0.239%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 25, Frequency: 209843750000000Hz; S Matrix Error =   0.326%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161676, 'I(1, 0, \'Frequency Group #6; Interpolating frequency sweep\')', true, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233784, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263124, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331084, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331084, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227168')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001063\', 1, \'Fbscputimesec\', \'0.001063\', 1, \'Fbsmemorytotalkb\', \'39532.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.660728\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043669\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39532\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234684, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264100, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332844, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332844, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227169')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001023\', 1, \'Fbscputimesec\', \'0.001023\', 1, \'Fbsmemorytotalkb\', \'40868.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.656966\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.047262\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40868\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 561462500000000Hz'
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232832, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262216, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330176, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330176, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227169')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001333\', 1, \'Fbscputimesec\', \'0.001333\', 1, \'Fbsmemorytotalkb\', \'40396.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.667265\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044606\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40396\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232328, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261680, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 327960, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 327960, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227170')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001387\', 1, \'Fbscputimesec\', \'0.001387\', 1, \'Fbsmemorytotalkb\', \'38232.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.617828\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.045056\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'38232\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 26, Frequency: 471687500000000Hz; S Matrix Error =   0.359%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 27, Frequency: 449243750000000Hz; S Matrix Error =   0.195%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 28, Frequency: 561462500000000Hz; S Matrix Error =   0.189%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 29, Frequency: 262212500000000Hz; S Matrix Error =   0.152%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161748, 'I(1, 0, \'Frequency Group #7; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 404356250000000Hz'
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232160, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261500, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330160, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330160, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227197')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001341\', 1, \'Fbscputimesec\', \'0.001341\', 1, \'Fbsmemorytotalkb\', \'40528.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.682028\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.042255\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40528\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234624, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264184, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332304, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332304, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227197')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000755\', 1, \'Fbscputimesec\', \'0.000755\', 1, \'Fbsmemorytotalkb\', \'40172.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.674367\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.046667\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40172\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233276, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262644, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330736, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330736, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227198')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001135\', 1, \'Fbscputimesec\', \'0.001135\', 1, \'Fbsmemorytotalkb\', \'40756.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.656586\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.045790\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40756\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234732, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 264332, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330312, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330312, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227198')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000725\', 1, \'Fbscputimesec\', \'0.000725\', 1, \'Fbsmemorytotalkb\', \'38528.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.646808\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.042631\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'38528\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 30, Frequency: 404356250000000Hz; S Matrix Error =   0.062%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 31, Frequency: 232287500000000Hz; S Matrix Error =   0.069%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 32, Frequency: 389393750000000Hz; S Matrix Error =   0.075%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 33, Frequency: 651237500000000Hz; S Matrix Error =   0.064%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162708, 'I(1, 0, \'Frequency Group #8; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #9\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232260, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261564, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329424, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329424, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227227')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001351\', 1, \'Fbscputimesec\', \'0.001351\', 1, \'Fbsmemorytotalkb\', \'39712.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.667028\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043020\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39712\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 224806250000000Hz'
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232820, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262348, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330164, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330164, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227227')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000937\', 1, \'Fbscputimesec\', \'0.000937\', 1, \'Fbsmemorytotalkb\', \'40280.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.663435\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.048887\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40280\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 213584375000000Hz'
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231964, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261352, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329304, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329304, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227228')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001323\', 1, \'Fbscputimesec\', \'0.001323\', 1, \'Fbsmemorytotalkb\', \'39676.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.662655\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.046991\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39676\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:01')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #9\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232628, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261976, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 327772, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 327772, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227228')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001013\', 1, \'Fbscputimesec\', \'0.001013\', 1, \'Fbsmemorytotalkb\', \'37976.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.678207\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043408\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37976\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 34, Frequency: 464206250000000Hz; S Matrix Error =   0.080%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 35, Frequency: 224806250000000Hz; S Matrix Error =   0.065%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 36, Frequency: 213584375000000Hz; S Matrix Error =   0.065%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 37, Frequency: 658718750000000Hz; S Matrix Error =   0.078%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162764, 'I(1, 0, \'Frequency Group #9; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #10\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232500, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261900, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329816, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329816, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227255')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000914\', 1, \'Fbscputimesec\', \'0.000914\', 1, \'Fbsmemorytotalkb\', \'40372.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.665152\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.047086\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40372\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #10\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233344, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262848, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330764, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330764, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227256')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001301\', 1, \'Fbscputimesec\', \'0.001301\', 1, \'Fbsmemorytotalkb\', \'40656.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.673031\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.045273\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40656\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #10\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234404, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263812, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 333600, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 333600, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227256')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000932\', 1, \'Fbscputimesec\', \'0.000932\', 1, \'Fbsmemorytotalkb\', \'41860.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.673496\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.045786\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41860\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 494131250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #10\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232732, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262072, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 328232, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 328232, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227257')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001459\', 1, \'Fbscputimesec\', \'0.001459\', 1, \'Fbsmemorytotalkb\', \'38408.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.671559\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.045871\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'38408\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 38, Frequency: 479168750000000Hz; S Matrix Error =   0.063%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 39, Frequency: 322062500000000Hz; Scattering matrix quantities converged; Passivity Error =   0.002741\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 40, Frequency: 419318750000000Hz; Scattering matrix quantities converged; Passivity Error =   0.036018\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 41, Frequency: 494131250000000Hz; New subrange(s) added; S Matrix Error =   0.076%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163000, 'I(1, 0, \'Frequency Group #10; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 434281250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #11\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232656, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262008, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329808, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329808, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227284')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000756\', 1, \'Fbscputimesec\', \'0.000756\', 1, \'Fbsmemorytotalkb\', \'40424.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.667175\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.045002\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40424\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 239768750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #11\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232552, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262024, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329844, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329844, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227284')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001346\', 1, \'Fbscputimesec\', \'0.001346\', 1, \'Fbsmemorytotalkb\', \'39644.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.663246\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.043949\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39644\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 591387500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #11\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234320, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263668, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332040, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332040, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227284')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000628\', 1, \'Fbscputimesec\', \'0.000628\', 1, \'Fbsmemorytotalkb\', \'40036.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.654635\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044589\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40036\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 351987500000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #11\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232884, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262236, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 327788, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 327788, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227285')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001323\', 1, \'Fbscputimesec\', \'0.001323\', 1, \'Fbsmemorytotalkb\', \'37868.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.621456\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.044157\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'37868\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 42, Frequency: 434281250000000Hz; S Matrix Error =   0.080%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 43, Frequency: 239768750000000Hz; S Matrix Error =   0.084%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 44, Frequency: 591387500000000Hz; S Matrix Error =   0.101%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 45, Frequency: 351987500000000Hz; S Matrix Error =   0.061%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163060, 'I(1, 0, \'Frequency Group #11; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 460316000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #12\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233392, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262712, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330964, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330964, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227312')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000688\', 1, \'Fbscputimesec\', \'0.000688\', 1, \'Fbsmemorytotalkb\', \'39672.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.688276\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.047812\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'39672\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 359468750000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #12\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233008, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262316, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330364, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330364, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227312')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001406\', 1, \'Fbscputimesec\', \'0.001406\', 1, \'Fbsmemorytotalkb\', \'40372.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.676438\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.050424\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40372\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 374431250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #12\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234544, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263880, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 333764, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 333764, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227313')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001332\', 1, \'Fbscputimesec\', \'0.001332\', 1, \'Fbsmemorytotalkb\', \'41864.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.680409\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.045687\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41864\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 344506250000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #12\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 233088, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 262360, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 327716, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 327716, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227313')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000900\', 1, \'Fbscputimesec\', \'0.000900\', 1, \'Fbsmemorytotalkb\', \'38136.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.683995\', 1, \'Factorizationmentotalkb\', \'33793.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.046181\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'38136\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 46, Frequency: 460316000000000Hz; S Matrix Error =   0.061%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 47, Frequency: 359468750000000Hz; Scattering matrix quantities converged; Passivity Error =   0.000369\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163196, 'I(1, 0, \'Frequency Group #12; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 438770000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:00')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'HFSS: Single Frequency Solve Group #13\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 166716, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, true)
					ProfileItem('Matrix Assembly', 0, 0, 1, 0, 256904, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, true)
					ProfileItem('Matrix Solve', 0, 0, 1, 0, 361852, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, true)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 361852, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, true)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227329')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000507\', 1, \'Fbscputimesec\', \'0.000507\', 1, \'Fbsmemorytotalkb\', \'135932.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.294390\', 1, \'Factorizationmentotalkb\', \'43554.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.042022\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'135932\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 48, Frequency: 438770000000000Hz; Scattering matrix quantities converged; Passivity Error =   0.000696\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163224, 'I(1, 0, \'Frequency #49;  Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 429194000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:00')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'HFSS: Single Frequency Solve Group #14\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 166824, 'I(2, 2, \'Tetrahedra\', 4700, false, 1, \'Disk\', \'0 Bytes\')', true, true)
					ProfileItem('Matrix Assembly', 0, 0, 1, 0, 257032, 'I(4, 2, \'Tetrahedra\', 4700, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, true)
					ProfileItem('Matrix Solve', 0, 0, 1, 0, 347128, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 28554, false, 3, \'Matrix bandwidth\', 42.8111, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, true)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 347128, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, true)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227333')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000651\', 1, \'Fbscputimesec\', \'0.000651\', 1, \'Fbsmemorytotalkb\', \'121176.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.264893\', 1, \'Factorizationmentotalkb\', \'43442.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2441\', 1, \'Factornnz\', \'5303003\', 1, \'Factorestflops\', \'6199456988\', 1, \'Fbsestflops\', \'36877192\', 1, \'Rootfactestflops\', \'17668222\', 1, \'Rootfbsestflops\', \'88804\', 1, \'Analysistimesec\', \'0.042753\', 1, \'Analysismemkb\', \'16064.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'121176\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28554\', 1, \'Matrixbw\', \'42.959900\', 1, \'Matrixnnz\', \'1226676\', 1, \'Rootdim\', \'298\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 49, Frequency: 429194000000000Hz; Scattering matrix quantities converged; Passive within tolerance\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163256, 'I(1, 0, \'Frequency #50;  Interpolating frequency sweep\')', true, true)
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
			ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:00\', 1, \'Total Memory\', \'149 MB\')', false, true)
			ProfileItem('Initial Meshing', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:04\', 1, \'Total Memory\', \'235 MB\')', false, true)
			ProfileItem('Adaptive Meshing', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:00:09\', 1, \'Average memory/process\', \'526 MB\', 1, \'Max memory/process\', \'525 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileItem('Frequency Sweep', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:05:56\', 1, \'Average memory/process\', \'324 MB\', 1, \'Max memory/process\', \'353 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileFootnote('I(3, 2, \'Max solved tets\', 4700, false, 2, \'Max matrix size\', 28554, false, 1, \'Matrix bandwidth\', \'42.8\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/09/2026 09:28:56\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
$end 'Profile'
