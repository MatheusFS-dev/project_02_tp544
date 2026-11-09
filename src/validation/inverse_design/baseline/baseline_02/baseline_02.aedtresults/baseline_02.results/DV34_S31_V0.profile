$begin 'Profile'
	$begin 'ProfileGroup'
		MajorVer=2025
		MinorVer=2
		Name='Solution Process'
		$begin 'StartInfo'
			I(1, 'Start Time', '11/09/2026 09:29:02')
			I(1, 'Host', 'XGM-046057LN')
			I(1, 'Processor', '36')
			I(1, 'OS', 'Linux 7.0.0-42-generic')
			I(1, 'Product', 'HFSS Version 2025.2.0')
		$end 'StartInfo'
		$begin 'TotalInfo'
			I(1, 'Elapsed Time', '00:04:16')
			I(1, 'ComEngine Memory', '157 M')
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
		ProfileItem('Design Validation', 0, 0, 0, 0, 0, 'I(1, 0, \'Elapsed time : 00:00:00 , HFSS ComEngine Memory : 150 M\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Perform full validations with standard port validations\')', false, true)
		ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Initial Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 09:29:02')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:04')
			$end 'TotalInfo'
			GroupOptions=4
			TaskDataOptions('CPU Time'=8, Memory=8, 'Real Time'=8)
			ProfileItem('Mesh', 0, 0, 0, 0, 56844, 'I(2, 1, \'Type\', \'Phi\', 2, \'Tetrahedra\', 341, false)', true, true)
			ProfileItem('Post', 0, 0, 0, 0, 58220, 'I(1, 2, \'Tetrahedra\', 379, false)', true, true)
			ProfileItem('Lambda Refine', 0, 0, 0, 0, 53536, 'I(1, 2, \'Tetrahedra\', 3624, false)', true, true)
			ProfileItem('Simulation Setup', 0, 0, 0, 0, 159064, 'I(2, 2, \'Tetrahedra\', 3624, false, 1, \'Disk\', \'0 Bytes\')', true, true)
			ProfileItem('Port Adapt', 0, 0, 0, 0, 161076, 'I(2, 2, \'Tetrahedra\', 3624, false, 1, \'Disk\', \'19.9 KB\')', true, true)
			ProfileItem('Port Refine', 0, 0, 0, 0, 53564, 'I(1, 2, \'Tetrahedra\', 4193, false)', true, true)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Adaptive Meshing'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 09:29:07')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:00:08')
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
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 163084, 'I(2, 2, \'Tetrahedra\', 4193, false, 1, \'Disk\', \'3.02 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 0, 0, 241936, 'I(4, 2, \'Tetrahedra\', 4193, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'340 KB\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 2, 0, 537888, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 25334, false, 3, \'Matrix bandwidth\', 42.7261, \'%5.1f\', 1, \'Disk\', \'99.8 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 0, 0, 537888, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.67 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 156816, 'I(1, 0, \'Adaptive Pass 1\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794227348')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.026641\', 1, \'Fbscputimesec\', \'0.053282\', 1, \'Fbsmemorytotalkb\', \'322384.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.359370\', 1, \'Factorizationmentotalkb\', \'223683.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2160\', 1, \'Factornnz\', \'5281353\', 1, \'Factorestflops\', \'7231078161\', 1, \'Fbsestflops\', \'37288284\', 1, \'Rootfactestflops\', \'21460904\', 1, \'Rootfbsestflops\', \'101124\', 1, \'Analysistimesec\', \'0.198490\', 1, \'Analysismemkb\', \'26920.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'322384\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'25334\', 1, \'Matrixbw\', \'42.837101\', 1, \'Matrixnnz\', \'1085236\', 1, \'Rootdim\', \'318\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
				ProfileItem('Adaptive Refine', 0, 0, 0, 0, 53620, 'I(1, 2, \'Tetrahedra\', 4772, false)', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				ProfileItem('Simulation Setup ', 0, 0, 0, 0, 165040, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'3.02 KB\')', true, true)
				ProfileItem('Matrix Assembly', 0, 0, 1, 0, 254692, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, true)
				ProfileItem('Matrix Solve', 0, 0, 3, 0, 581648, 'I(5, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 1, \'Disk\', \'113 KB\')', true, true)
				ProfileItem('Field Recovery', 0, 0, 0, 0, 581648, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'1.32 MB\')', true, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 156816, 'I(1, 0, \'Adaptive Pass 2\')', true, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='APIPms'
					$begin 'StartInfo'
						I(1, 'Timesinceepock', '1794227353')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, ' ')
					$end 'TotalInfo'
					GroupOptions=16
					TaskDataOptions(Memory=8)
					ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'fullsolve\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'false\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'2\', 1, \'Fbsnumsolves\', \'2\', 1, \'Fbsavgsolvetime1solvesec\', \'0.035666\', 1, \'Fbscputimesec\', \'0.071331\', 1, \'Fbsmemorytotalkb\', \'357940.000000\')', false, true)
					ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.412892\', 1, \'Factorizationmentotalkb\', \'248922.000000\')', false, true)
					ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2499\', 1, \'Factornnz\', \'6097841\', 1, \'Factorestflops\', \'8379801388\', 1, \'Fbsestflops\', \'42955952\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.222711\', 1, \'Analysismemkb\', \'31472.000000\')', false, true)
					ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'357940\', 1, \'Maxdiskkb\', \'0\')', false, true)
					ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
					ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
				$end 'ProfileGroup'
				ProfileFootnote('I(1, 3, \'Max Mag. Delta S\', 0.00425101, \'%.5f\')', 0)
			$end 'ProfileGroup'
			ProfileFootnote('I(1, 0, \'Adaptive Passes converged\')', 0)
		$end 'ProfileGroup'
		$begin 'ProfileGroup'
			MajorVer=2025
			MinorVer=2
			Name='Frequency Sweep'
			$begin 'StartInfo'
				I(1, 'Time', '11/09/2026 09:29:16')
			$end 'StartInfo'
			$begin 'TotalInfo'
				I(1, 'Elapsed Time', '00:04:03')
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
					I(1, 'Time', '11/09/2026 09:29:16')
				$end 'StartInfo'
				$begin 'TotalInfo'
					I(1, 'Elapsed Time', '00:04:03')
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231836, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260776, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 341732, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'115 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 341732, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227368')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000950\', 1, \'Fbscputimesec\', \'0.000950\', 1, \'Fbsmemorytotalkb\', \'52788.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.783108\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.336291\', 1, \'Analysismemkb\', \'16544.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'52788\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230132, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259216, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 339948, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'115 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 339948, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227369')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000898\', 1, \'Fbscputimesec\', \'0.000898\', 1, \'Fbsmemorytotalkb\', \'52340.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.780006\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.318191\', 1, \'Analysismemkb\', \'16404.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'52340\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231996, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260928, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 341660, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'115 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 341660, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227369')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001297\', 1, \'Fbscputimesec\', \'0.001297\', 1, \'Fbsmemorytotalkb\', \'52120.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.768371\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.308118\', 1, \'Analysismemkb\', \'16220.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'52120\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229984, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 258856, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 1, 0, 1, 0, 339588, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'115 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 339588, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227370')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000938\', 1, \'Fbscputimesec\', \'0.000938\', 1, \'Fbsmemorytotalkb\', \'52140.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.736385\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.306513\', 1, \'Analysismemkb\', \'16220.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'52140\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 1, Frequency: 666200000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 2, Frequency: 187400000000000Hz; Additional basis points are needed before the interpolation error can be computed.\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 3, Frequency: 426800000000000Hz; S Matrix Error = 153.004%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 4, Frequency: 307100000000000Hz; S Matrix Error = 132.263%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 5, Frequency: 546500000000000Hz; S Matrix Error =  81.831%\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232556, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261520, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332088, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332088, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227399')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000635\', 1, \'Fbscputimesec\', \'0.000635\', 1, \'Fbsmemorytotalkb\', \'42804.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.835866\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.050657\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42804\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230020, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 258316, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 328884, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 328884, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227400')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001209\', 1, \'Fbscputimesec\', \'0.001209\', 1, \'Fbsmemorytotalkb\', \'41056.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.847162\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.063922\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41056\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232240, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261380, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331868, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331868, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227400')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000635\', 1, \'Fbscputimesec\', \'0.000635\', 1, \'Fbsmemorytotalkb\', \'42272.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.816862\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.049379\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42272\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229884, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259196, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329660, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329660, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227400')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000626\', 1, \'Fbscputimesec\', \'0.000626\', 1, \'Fbsmemorytotalkb\', \'42024.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.811660\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.050169\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42024\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 6, Frequency: 606350000000000Hz; S Matrix Error =  58.270%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 7, Frequency: 486650000000000Hz; S Matrix Error =  55.661%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 8, Frequency: 366950000000000Hz; S Matrix Error =  54.731%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 9, Frequency: 247250000000000Hz; S Matrix Error =  63.798%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161888, 'I(1, 0, \'Frequency Group #2; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230428, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259040, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329500, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329500, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227427')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001098\', 1, \'Fbscputimesec\', \'0.001098\', 1, \'Fbsmemorytotalkb\', \'41960.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.796203\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.051733\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41960\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230676, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259628, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330088, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330088, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227428')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000944\', 1, \'Fbscputimesec\', \'0.000944\', 1, \'Fbsmemorytotalkb\', \'42148.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.786290\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.050377\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42148\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229844, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 258912, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329260, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329260, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227428')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001342\', 1, \'Fbscputimesec\', \'0.001342\', 1, \'Fbsmemorytotalkb\', \'41540.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.781596\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.047588\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41540\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #3\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234192, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263352, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 333804, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 333804, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227428')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000914\', 1, \'Fbscputimesec\', \'0.000914\', 1, \'Fbsmemorytotalkb\', \'42192.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.742632\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.046393\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42192\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 10, Frequency: 217325000000000Hz; S Matrix Error =  24.808%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 11, Frequency: 277175000000000Hz; S Matrix Error =  23.757%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 12, Frequency: 337025000000000Hz; S Matrix Error =  32.670%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 13, Frequency: 456725000000000Hz; S Matrix Error =  26.918%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 161996, 'I(1, 0, \'Frequency Group #3; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232456, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261476, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331964, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331964, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227455')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000848\', 1, \'Fbscputimesec\', \'0.000848\', 1, \'Fbsmemorytotalkb\', \'42496.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.765546\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.045644\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42496\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230560, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259692, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330428, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330428, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227456')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000842\', 1, \'Fbscputimesec\', \'0.000842\', 1, \'Fbsmemorytotalkb\', \'42740.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.802814\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.047479\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42740\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230356, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259488, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329812, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329812, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227457')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000932\', 1, \'Fbscputimesec\', \'0.000932\', 1, \'Fbsmemorytotalkb\', \'42128.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.775219\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.048542\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42128\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #4\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 228608, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 257572, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 328036, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 328036, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227457')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000805\', 1, \'Fbscputimesec\', \'0.000805\', 1, \'Fbsmemorytotalkb\', \'40472.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.755751\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.045611\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'40472\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 14, Frequency: 396875000000000Hz; S Matrix Error =  19.818%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 15, Frequency: 516575000000000Hz; S Matrix Error =   2.616%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 16, Frequency: 636275000000000Hz; S Matrix Error =   2.324%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 17, Frequency: 441762500000000Hz; S Matrix Error =   1.950%\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162080, 'I(1, 0, \'Frequency Group #4; Interpolating frequency sweep\')', true, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230644, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259676, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329948, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329948, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227486')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000903\', 1, \'Fbscputimesec\', \'0.000903\', 1, \'Fbsmemorytotalkb\', \'42692.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.782727\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.045120\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42692\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230528, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259640, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330200, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330200, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227486')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001259\', 1, \'Fbscputimesec\', \'0.001259\', 1, \'Fbsmemorytotalkb\', \'42392.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.776082\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.046185\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42392\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230464, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259420, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330328, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330328, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227487')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001325\', 1, \'Fbscputimesec\', \'0.001325\', 1, \'Fbsmemorytotalkb\', \'42808.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.786573\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.046436\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42808\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #5\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229964, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 258952, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329504, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329504, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227487')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001251\', 1, \'Fbscputimesec\', \'0.001251\', 1, \'Fbsmemorytotalkb\', \'41920.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.750059\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.051520\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41920\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 18, Frequency: 471687500000000Hz; S Matrix Error =   1.915%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 19, Frequency: 501612500000000Hz; S Matrix Error =   1.125%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 20, Frequency: 576425000000000Hz; S Matrix Error =   0.760%\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 21, Frequency: 651237500000000Hz; S Matrix Error =   0.399%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162136, 'I(1, 0, \'Frequency Group #5; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231260, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260220, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 330520, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 330520, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227516')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000826\', 1, \'Fbscputimesec\', \'0.000826\', 1, \'Fbsmemorytotalkb\', \'41184.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.807389\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.046834\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41184\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230268, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259340, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329828, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329828, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227516')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001267\', 1, \'Fbscputimesec\', \'0.001267\', 1, \'Fbsmemorytotalkb\', \'42028.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.773426\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.049992\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42028\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232108, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261256, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331732, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331732, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227517')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000752\', 1, \'Fbscputimesec\', \'0.000752\', 1, \'Fbsmemorytotalkb\', \'42024.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.782732\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.047248\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42024\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #6\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230204, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259148, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329888, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329888, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227517')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001120\', 1, \'Fbscputimesec\', \'0.001120\', 1, \'Fbsmemorytotalkb\', \'42396.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.735555\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.048313\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42396\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 22, Frequency: 411837500000000Hz; S Matrix Error =   0.476%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 23, Frequency: 381912500000000Hz; S Matrix Error =   0.265%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 24, Frequency: 202362500000000Hz; S Matrix Error =   0.129%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 25, Frequency: 322062500000000Hz; S Matrix Error =   0.123%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162212, 'I(1, 0, \'Frequency Group #6; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229956, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 258956, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329524, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329524, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227546')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001003\', 1, \'Fbscputimesec\', \'0.001003\', 1, \'Fbsmemorytotalkb\', \'42224.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.785156\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.044636\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42224\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230228, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259112, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329892, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329892, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227547')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000576\', 1, \'Fbscputimesec\', \'0.000576\', 1, \'Fbsmemorytotalkb\', \'42340.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.801737\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.047804\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42340\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229760, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 258712, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 328772, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 328772, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227547')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000687\', 1, \'Fbscputimesec\', \'0.000687\', 1, \'Fbsmemorytotalkb\', \'41336.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.763672\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.050941\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41336\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #7\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 232616, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 261548, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 332104, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 332104, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227548')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001246\', 1, \'Fbscputimesec\', \'0.001246\', 1, \'Fbsmemorytotalkb\', \'42352.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.760799\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.046106\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42352\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 26, Frequency: 419318750000000Hz; S Matrix Error =   0.158%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 27, Frequency: 434281250000000Hz; S Matrix Error =   0.094%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 28, Frequency: 404356250000000Hz; S Matrix Error =   0.056%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 29, Frequency: 494131250000000Hz; S Matrix Error =   0.066%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 162276, 'I(1, 0, \'Frequency Group #7; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
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
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 231832, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 260800, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 331752, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 331752, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227577')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001254\', 1, \'Fbscputimesec\', \'0.001254\', 1, \'Fbsmemorytotalkb\', \'42536.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.802925\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.046365\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42536\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 234712, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 263680, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 334248, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 334248, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227577')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000886\', 1, \'Fbscputimesec\', \'0.000886\', 1, \'Fbsmemorytotalkb\', \'42536.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.799144\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.046378\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42536\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 230400, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 259388, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329772, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329772, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227578')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001319\', 1, \'Fbscputimesec\', \'0.001319\', 1, \'Fbsmemorytotalkb\', \'42504.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.778992\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.048219\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'42504\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
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
						I(0, 'Elapsed time : 00:00:02')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Distributed Solve Group #8\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 229692, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Assembly', 0, 0, 0, 0, 258512, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, false)
					ProfileItem('Matrix Solve', 0, 0, 0, 0, 329396, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 1, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.6 KB\')', true, false)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 329396, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, false)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227578')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'1\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.001275\', 1, \'Fbscputimesec\', \'0.001275\', 1, \'Fbsmemorytotalkb\', \'41936.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'1\', 1, \'Factorizationtimesec\', \'0.743464\', 1, \'Factorizationmentotalkb\', \'37542.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.045170\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'41936\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 30, Frequency: 449243750000000Hz; S Matrix Error =   0.075%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 31, Frequency: 351987500000000Hz; S Matrix Error =   0.095%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 32, Frequency: 531537500000000Hz; S Matrix Error =   0.071%; Secondary solver criterion is not converged\')', false, true)
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 33, Frequency: 292137500000000Hz; Scattering matrix quantities converged; Passivity Error =   0.000975\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163304, 'I(1, 0, \'Frequency Group #8; Interpolating frequency sweep\')', true, true)
				ProfileItem(' ', 0, 0, 0, 0, 0, 'I(1, 0, \'\')', false, true)
				$begin 'ProfileGroup'
					MajorVer=2025
					MinorVer=2
					Name='Frequency - 420815000000000Hz'
					$begin 'StartInfo'
						I(0, 'XGM-046057LN')
					$end 'StartInfo'
					$begin 'TotalInfo'
						I(0, 'Elapsed time : 00:00:00')
					$end 'TotalInfo'
					GroupOptions=0
					TaskDataOptions('CPU Time'=8, 'Real Time'=8)
					ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'HFSS: Single Frequency Solve Group #9\')', false, true)
					ProfileItem('Simulation Setup ', 0, 0, 0, 0, 164068, 'I(2, 2, \'Tetrahedra\', 4772, false, 1, \'Disk\', \'0 Bytes\')', true, true)
					ProfileItem('Matrix Assembly', 0, 0, 1, 0, 254528, 'I(4, 2, \'Tetrahedra\', 4772, false, 2, \'FloquetCima Triangles\', 256, false, 2, \'FloquetBaixo Triangles\', 256, false, 1, \'Disk\', \'0 Bytes\')', true, true)
					ProfileItem('Matrix Solve', 0, 0, 1, 0, 348552, 'I(6, 1, \'Type\', \'DCA\', 2, \'Cores\', 4, false, 2, \'Matrix size\', 28998, false, 3, \'Matrix bandwidth\', 42.8753, \'%5.1f\', 2, \'S-matrix only solve\', 8, false, 1, \'Disk\', \'1.61 KB\')', true, true)
					ProfileItem('Field Recovery', 0, 0, 0, 0, 348552, 'I(2, 2, \'Excitations\', 8, false, 1, \'Disk\', \'16.2 KB\')', true, true)
					$begin 'ProfileGroup'
						MajorVer=2025
						MinorVer=2
						Name='APIPms1'
						$begin 'StartInfo'
							I(1, 'Timesinceepock', '1794227596')
						$end 'StartInfo'
						$begin 'TotalInfo'
							I(0, ' ')
						$end 'TotalInfo'
						GroupOptions=16
						TaskDataOptions('CPU Time'=8, 'Real Time'=8)
						ProfileItem('fbsinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Fbstatus\', \'valid\', 1, \'Fbstype\', \'partial_dense\', 1, \'Fbsmt\', \'false\', 1, \'Fbsmrhs\', \'true\', 1, \'Fbsnumcores\', \'4\', 1, \'Fbsnumsolvestotal\', \'8\', 1, \'Fbsnumsolves\', \'1\', 1, \'Fbsavgsolvetime1solvesec\', \'0.000606\', 1, \'Fbscputimesec\', \'0.000606\', 1, \'Fbsmemorytotalkb\', \'124868.000000\')', false, true)
						ProfileItem('factorinfo', 0, 0, 0, 0, 0, 'I(4, 1, \'Fatorizationstatus\', \'valid\', 1, \'Factorizationnumcores\', \'4\', 1, \'Factorizationtimesec\', \'0.303856\', 1, \'Factorizationmentotalkb\', \'48442.000000\')', false, true)
						ProfileItem('analysisinfo', 0, 0, 0, 0, 0, 'I(9, 1, \'Analysisstatus\', \'valid\', 1, \'Numsupernodes\', \'2508\', 1, \'Factornnz\', \'5889389\', 1, \'Factorestflops\', \'7682272172\', 1, \'Fbsestflops\', \'41511768\', 1, \'Rootfactestflops\', \'15950884\', 1, \'Rootfbsestflops\', \'82944\', 1, \'Analysistimesec\', \'0.044479\', 1, \'Analysismemkb\', \'16333.000000\')', false, true)
						ProfileItem('solverprofile', 0, 0, 0, 0, 0, 'I(2, 1, \'Maxmemkb\', \'124868\', 1, \'Maxdiskkb\', \'0\')', false, true)
						ProfileItem('solverinfo', 0, 0, 0, 0, 0, 'I(10, 1, \'Solvertype\', \'shared_memory\', 1, \'Precision\', \'double\', 1, \'Solversymmetry\', \'complex_unsym\', 1, \'Matrixdim\', \'28998\', 1, \'Matrixbw\', \'43.018600\', 1, \'Matrixnnz\', \'1247452\', 1, \'Rootdim\', \'288\', 1, \'Mathtype\', \'mkl\', 1, \'Mpitasks\', \'1\', 1, \'Threadspertasks\', \'0\')', false, true)
						ProfileItem('sysinfo', 0, 0, 0, 0, 0, 'I(12, 1, \'Os\', \'lin\', 1, \'Cpuid\', \'Intel(R) Xeon(R) Gold 5220 CPU @ 2.20GHz\', 1, \'CpuPhysicCores\', \'18\', 1, \'CpuLogicCores\', \'36\', 1, \'Cpufreqkhz\', \'2200000000.000000\', 1, \'Cpucachelinesizebytes\', \'64\', 1, \'Cpuestlastlevelcachesizemb\', \'36.000000\', 1, \'Cpuestgflops\', \'844.799988\', 1, \'Memorybwestkbps\', \'128.000000\', 1, \'Numanodes\', \'1\', 1, \'Virtualmemkb\', \'-1.000000\', 1, \'Pagesizekb\', \'4096\')', false, true)
					$end 'ProfileGroup'
				$end 'ProfileGroup'
				ProfileItem('', 0, 0, 0, 0, 0, 'I(1, 0, \'Basis Element # 34, Frequency: 420815000000000Hz; Scattering matrix quantities converged; Passive within tolerance\')', false, true)
				ProfileItem('Data Transfer', 0, 0, 0, 0, 163332, 'I(1, 0, \'Frequency #33;  Interpolating frequency sweep\')', true, true)
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
			ProfileItem('Initial Meshing', 0, 0, 0, 0, 0, 'I(2, 1, \'Elapsed Time\', \'00:00:04\', 1, \'Total Memory\', \'214 MB\')', false, true)
			ProfileItem('Adaptive Meshing', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:00:08\', 1, \'Average memory/process\', \'568 MB\', 1, \'Max memory/process\', \'568 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileItem('Frequency Sweep', 0, 0, 0, 0, 0, 'I(5, 1, \'Elapsed Time\', \'00:04:03\', 1, \'Average memory/process\', \'324 MB\', 1, \'Max memory/process\', \'340 MB\', 2, \'Max number of processes/frequency\', 1, false, 2, \'Total number of cores\', 4, false)', false, true)
			ProfileFootnote('I(3, 2, \'Max solved tets\', 4772, false, 2, \'Max matrix size\', 28998, false, 1, \'Matrix bandwidth\', \'42.9\')', 0)
		$end 'ProfileGroup'
		ProfileFootnote('I(2, 1, \'Stop Time\', \'11/09/2026 09:33:19\', 1, \'Status\', \'Normal Completion\')', 0)
	$end 'ProfileGroup'
$end 'Profile'
