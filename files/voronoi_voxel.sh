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