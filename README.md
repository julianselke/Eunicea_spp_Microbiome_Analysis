# _Eunicea_ spp. Microbiome Analysis

<h6>Part of an Internship at BIOMMAR group at Universidad de los Andes, Bogotá, Colombia.</h6>

<h3>Abstarct</h3> 
(by Adriana Sarmiento) <br><br>

The group of octocorals is one of the most diverse lineages of marine benthic animals, with around 3500 valid species, including gorgonians, soft corals and sea pens. Octocorals comprise an essential component of benthic communities, providing tri-dimensional structures and habitat for many species. At the same time, they constitute part of the dominant fauna in many Caribbean reef systems, where their diversity and biomass can surpass that of the scleractinian corals. Candelabrum corals from the endemic genus Eunicea are the most diverse and abundant group of octocorals in the Caribbean reefs. With more than 30 species described but only with 16 of them considered as valid species. Besides, the high diversity within the Eunicea genus remains highly misunderstood, and the ecological processes that promoted diversification in the group have not been studied yet. Such ecological processes encompass the holobiont and the interactions between the coral host and its associated microbiota, alongside their evolutive history. Furthermore, there is a high potential for nutritional plasticity expected for Eunicea, considering this group as mixotrophic species that can acquire nutrients through the autotrophic activity of their symbionts, but also through the heterotrophic capacity of the host, which can enable differential niche exploitation and potentially drive species diversification. In this study we provide a complete phylogeny of the group, evaluate eco-evolutionary patterns among Eunicea species and their microbial communities associated and compare the mixotrophic strategies between species with different morphological traits in order to explore if the trophic preferences comprise an ecological factor enabling species diversification.

<br><hr><br>

<h2>Overview</h2> 

This repository contains all scripts used in the bioinformatic microbiome analysis of *Eunicea*-associated bacteria. The **Qiime2**[^1] software and several packages available in the **R** programming language[^2] were used in this analysis. To facilitate reproducibility, a **podman** container can be created and configured in a few steps:

**Commands for Ubuntu Linux**

0. Install **podman**

   Please follow instructions at https://podman.io/getting-started/installation

1. Create a directory to work in. This directory will be shared with the container.

   e.g. <code> mkdir ./eunicea_microbiome_analysis && cd eunicea_microbiome_analysis</code>

2. In the directory run the follwoing command: <br>
   <code>firefox https://github.com/julianselke/Eunicea_spp_Microbiome_Analysis/archive/refs/heads/main.zip \\</code><br>
   <code>&& mv ~/Downloads/Eunicea_spp_Microbiome_Analysis-main.zip . \\</code><br>
   <code>&& unzip Eunicea_spp_Microbiome_Analysis-main.zip \\</code><br>
   <code>&& bash Eunicea_spp_Microbiome_Analysis-main/init.sh</code>

5. Place the raw sequences in <code>fastq</code> format inside the <code>raw_data</code> directory and the metadata in the <code>data</code> directory.

6. Visit <code>localhost:33333</code> in your favourite browser (_firefox_ or _chromium_ are recommended). Enter ```n``` ```o``` ```c``` ```l``` ```a``` ```v``` ```e``` in the passwort prompt and doubleclick on ```Master_Analysis.ipynb```. 

7. After use, run ```podman stop biommar``` to shut down the **podman** container. 

To restart the container run ```podman start biommar```.


<br><hr><br>

[^1]: Bolyen E, Rideout JR, Dillon MR, Bokulich NA, Abnet CC, Al-Ghalith GA, Alexander H, Alm EJ, Arumugam M, Asnicar F, Bai Y, Bisanz JE, Bittinger K, Brejnrod A, Brislawn CJ, Brown CT, Callahan BJ, Caraballo-Rodríguez AM, Chase J, Cope EK, Da Silva R, Diener C, Dorrestein PC, Douglas GM, Durall DM, Duvallet C, Edwardson CF, Ernst M, Estaki M, Fouquier J, Gauglitz JM, Gibbons SM, Gibson DL, Gonzalez A, Gorlick K, Guo J, Hillmann B, Holmes S, Holste H, Huttenhower C, Huttley GA, Janssen S, Jarmusch AK, Jiang L, Kaehler BD, Kang KB, Keefe CR, Keim P, Kelley ST, Knights D, Koester I, Kosciolek T, Kreps J, Langille MGI, Lee J, Ley R, Liu YX, Loftfield E, Lozupone C, Maher M, Marotz C, Martin BD, McDonald D, McIver LJ, Melnik AV, Metcalf JL, Morgan SC, Morton JT, Naimey AT, Navas-Molina JA, Nothias LF, Orchanian SB, Pearson T, Peoples SL, Petras D, Preuss ML, Pruesse E, Rasmussen LB, Rivers A, Robeson MS, Rosenthal P, Segata N, Shaffer M, Shiffer A, Sinha R, Song SJ, Spear JR, Swafford AD, Thompson LR, Torres PJ, Trinh P, Tripathi A, Turnbaugh PJ, Ul-Hasan S, van der Hooft JJJ, Vargas F, Vázquez-Baeza Y, Vogtmann E, von Hippel M, Walters W, Wan Y, Wang M, Warren J, Weber KC, Williamson CHD, Willis AD, Xu ZZ, Zaneveld JR, Zhang Y, Zhu Q, Knight R, and Caporaso JG. 2019. Reproducible, interactive, scalable and extensible microbiome data science using QIIME 2. Nature Biotechnology 37: 852–857. https://doi.org/10.1038/s41587-019-0209-9

[^2]: R Core Team (2021). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
