#!/bin/bash

echo "Cleaning up remaining expert language patterns..."

# Additional patterns that the first script missed
declare -A additional_replacements=(
    # Description lines that still have Master/Expert
    ["description: Master Rust 1.75+="]="description: Work with Rust 1.75+"
    ["description: Master Go 1.21+="]="description: Work with Go 1.21+"
    ["description: Master Java 21+="]="description: Work with Java 21+"
    ["description: Master modern business analysis"]="description: Work with modern business analysis"
    ["description: Master enterprise-grade Scala"]="description: Work with enterprise-grade Scala"
    ["description: Master TypeScript with advanced types"]="description: Work with TypeScript with advanced types"
    ["description: Master Minecraft server plugin development"]="description: Work with Minecraft server plugin development"
    ["description: Expert Kubernetes architect"]="description: Kubernetes architect"
    ["description: Expert UI/UX designer"]="description: UI/UX designer"
    
    # "mastering" patterns
    ["mastering Rust 1.75+ features"]="working with Rust 1.75+ features"
    ["mastering Go 1.21+ features"]="working with Go 1.21+ features"
    ["mastering Java 21+ features"]="working with Java 21+ features"
    ["mastering advanced IaC automation"]="working with advanced IaC automation"
    ["mastering user research methodologies"]="working with user research methodologies"
    ["mastering container orchestration"]="working with container orchestration"
    
    # "Expert in" patterns
    ["Expert in the latest Rust ecosystem"]="Proficient with the latest Rust ecosystem"
    ["Expert in the latest Go ecosystem"]="Proficient with the latest Go ecosystem"
    ["Expert in the latest Java ecosystem"]="Proficient with the latest Java ecosystem"
    
    # "You are a ... expert" patterns
    ["You are a Java expert"]="You are a Java developer"
    ["You are a UI/UX design expert"]="You are a UI/UX designer"
    ["You are a Minecraft plugin development master"]="You are a Minecraft plugin developer"
    
    # "Expert ... developer" patterns
    ["Expert Java developer"]="Java developer"
    ["Expert UI/UX designer"]="UI/UX designer"
    ["Expert Kubernetes architect"]="Kubernetes architect"
    
    # Section headers still missed
    ["## Core Expertise"]="## Core Focus"
    
    # "Masters" patterns still present
    ["Masters user research"]="Works with user research"
    ["Masters container orchestration"]="Works with container orchestration"
    ["Masters Kubernetes across"]="Works with Kubernetes across"
    ["Masters EKS/AKS/GKE"]="Works with EKS/AKS/GKE"
    
    # Keep technical master-slave terms but note they're technical
    # These are database replication patterns, not confidence language
)

# Apply additional replacements
for file in *.md; do
    if [[ -f "$file" ]]; then
        echo "Processing $file..."
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Copy original file to temp
        cp "$file" "$temp_file"
        
        # Apply all additional replacements
        for pattern in "${!additional_replacements[@]}"; do
            replacement="${additional_replacements[$pattern]}"
            sed -i "s|$pattern|$replacement|g" "$temp_file"
        done
        
        # Handle regex patterns for more complex cases
        # Remove "Expert" from descriptions
        sed -i -E 's/description: Expert ([a-zA-Z]+)/description: \1/g' "$temp_file"
        
        # Remove "mastering" patterns
        sed -i -E 's/([a-zA-Z]+ developer) mastering ([a-zA-Z]+)/\1 working with \2/g' "$temp_file"
        
        # Remove "Expert" from role descriptions
        sed -i -E 's/You are a ([a-zA-Z]+) expert/You are a \1/g' "$temp_file"
        
        # Remove "Expert" from developer descriptions
        sed -i -E 's/Expert ([a-zA-Z]+ developer)/\1/g' "$temp_file"
        sed -i -E 's/Expert ([a-zA-Z]+ architect)/\1/g' "$temp_file"
        sed -i -E 's/Expert ([a-zA-Z]+ designer)/\1/g' "$temp_file"
        
        # Clean up remaining "Masters" patterns
        sed -i -E 's/Masters ([a-zA-Z]+)/Works with \1/g' "$temp_file"
        
        # Move temp file back to original
        mv "$temp_file" "$file"
    fi
done

echo "Additional expert language cleanup complete!"
