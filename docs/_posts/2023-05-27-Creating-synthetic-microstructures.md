---
layout: single
title:  "Creating Synthetic Microstructures"
toc: true
toc_sticky: true
tags:
  - DREAM.3D
  - Neper
---
<script src="/js/copyCode.js" defer></script>

Microstructure refers to the internal organization of a material. Due to the nature of my research I am focused on investigating polycrystalline materials. Polycrystalline materials refer to those materials that have many `crystals` e.g. Copper, Iron, Aluminum etc. If we put these materials under a microscope we can see that they consist of many small elements or building blocks like a jigsaw puzzle which we refer to as grains. [DREAM.3D](http://dream3d.bluequartz.net/) and [Neper](https://neper.info/) are two of the most prominent software for creation of two and three dimensional synthetic microstructures.<br/>

# DREAM.3D

DREAM.3D fills up a given space with grains of random shapes and sizes, and allows them to grow in all directions untill no empty `voxels(3D pixels)` are remaining.

![DREAM.3D-twin]({{ site.url }}{{ site.baseurl }}/docs/assets/images/twin.jpg){: .align-center}

## Slurm script for DREAM.3D
More information about the inner workings of DREAM.3D can be found in Mike Groeber's [paper](https://link.springer.com/article/10.1186/2193-9772-3-5). Creation of a relatively realistic synthetic microstructures requires a lot of computing. I usually create the DREAM.3D synthetics in `Holland Computing Center (HCC)` Slurm based cluster.
The script to generate many realizations follows:

{% include code_header.html %}
{% highlight bash %}
#!/bin/sh
#SBATCH --array=1-40
#SBATCH --nodes=1
#SBATCH --time=127:00:00
#SBATCH --mem=64G
#SBATCH -o two_phase_30-%A_%a.out --array=1-40

module load singularity
mkdir /<path>/<to>/<json file>/$SLURM_ARRAY_TASK_ID
singularity exec -B /<path>/<to>/<json file>/$SLURM_ARRAY_TASK_ID:/mnt docker://unlhcc/dream3d PipelineRunner -p /<path>/<to>/<json file>/*.json
{% endhighlight %}

The GUI of DREAM.3D creates a `.json` file and it can be run from the command line using the `PipelineRunner -p` command.

# Neper

Neper is based on `Voronoi` tessellation. Neper fills a given space with random `seed` points. Neper has the capability to generate microstructures of different grain size distributions. The image below shows a `3D Voronoi polycrystal`.

![Neper-Voronoi]({{ site.url }}{{ site.baseurl }}/docs/assets/images/laguerre.png){: .align-center}

## Slurm script for Voronoi tessellation
As our codebase is for `voxelized` format of synthetic microstructure, the generated polycrystals are converted to a raster or voxelized format. An example code for generating voronoi polycrystal in a `slurm cluster` is shown below. Please note that the time of my investigation the current `version` of Neper was **3.5**.  

{% include code_header.html %}
{% highlight bash %}
#!/bin/sh
#SBATCH --nodes=1
#SBATCH --array=1-10
#SBATCH --ntasks=10
#SBATCH --time=120:59:00       
#SBATCH --mem=15G      
#SBATCH --job-name=vor_9sd_500_cube_array
#SBATCH -o slurm-%A_%a.out --array=1-10

module load neper/3.5
mkdir $SLURM_ARRAY_TASK_ID
cd $SLURM_ARRAY_TASK_ID
domain_val=500
mean_val=30
sd_val=9;

neper -T -n from_morpho -id $SLURM_ARRAY_TASK_ID -domain "cube($domain_val,$domain_val,$domain_val)" -morpho "voronoi,diameq:lognormal($mean_val,$sd_val)" -format tesr,ori -tesrsize $domain_val -tesrformat binary16 -oricrysym cubic -ori random -statcell size,diameq,w -o voronoi_sd"$sd_val"_"$domain_val"
{% endhighlight %}

![Neper-Voronoi]({{ site.url }}{{ site.baseurl }}/docs/assets/images/voronoi.png){: .align-center}
## Slurm script for Laguerre tessellation
`Laguerre` tessellation is based on Voronoi tessellation. The main difference for Laguerre is that the generated seed are not equidistant from the grain boundary. Laguerre tessellation is used for simulating foams and is better in making a `wider grain-size distributions`.  

{% include code_header.html %}
{% highlight bash %}
#!/bin/sh
#SBATCH --nodes=1
#SBATCH --array=1-10
#SBATCH --ntasks=10
#SBATCH --time=69:59:00       
#SBATCH --mem=20G      
#SBATCH --job-name=laguerre_sd9_200_cube_array
#SBATCH -o slurm-%A_%a.out --array=1-10

module load neper/3.5
mkdir $SLURM_ARRAY_TASK_ID
cd $SLURM_ARRAY_TASK_ID
domain_val=500
mean_val=30
sd_val=9;

neper -T -n from_morpho -id $SLURM_ARRAY_TASK_ID -domain "cube($domain_val,$domain_val,$domain_val)" -morpho "diameq:lognormal($mean_val,$sd_val)" -morphooptiini "coo:packing,weight:0.5*diameq" -format tesr,ori -tesrsize $domain_val -tesrformat binary16 -oricrysym cubic -ori random -statcell size,diameq,w -o laguerre_sd"$sd_val"_"$domain_val"

{% endhighlight %}
