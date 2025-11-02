#!/bin/bash

# Script to remove overconfident "expert" language from agent files
# Replaces with more thoughtful, growth-oriented language

echo "Removing expert language from agent files..."

# Define replacement patterns
declare -A replacements=(
    # Expert role replacements
    ["Expert backend architect"]="Backend architect"
    ["Expert Terraform/OpenTofu specialist"]="Terraform/OpenTofu specialist"
    ["Expert Rust developer"]="Rust developer"
    ["Expert cloud architect"]="Cloud architect"
    ["Expert data scientist"]="Data scientist"
    ["Expert Go developer"]="Go developer"
    ["Expert FastAPI developer"]="FastAPI developer"
    ["Expert mobile developer"]="Mobile developer"
    ["Expert iOS developer"]="iOS developer"
    ["Expert blockchain developer"]="Blockchain developer"
    ["Expert MLOps engineer"]="MLOps engineer"
    ["Expert code reviewer"]="Code reviewer"
    ["Expert API documentation specialist"]="API documentation specialist"
    ["Expert incident responder"]="Incident responder"
    ["Expert observability engineer"]="Observability engineer"
    ["Expert data engineer"]="Data engineer"
    
    # Master replacements
    ["Master Rust 1.75+="]="Work with Rust 1.75+"
    ["Master Go 1.21+="]="Work with Go 1.21+"
    ["Master modern business analysis"]="Work with modern business analysis"
    ["Master enterprise-grade Scala"]="Work with enterprise-grade Scala"
    ["Master TypeScript with advanced types"]="Work with TypeScript with advanced types"
    ["Master software architect"]="Software architect"
    ["Master code reviewer"]="Code reviewer"
    
    # Specializing replacements
    ["specializing in"]="focused on"
    ["specializing"]="focused"
    
    # Masters verb replacements
    ["Masters REST"]="Works with REST"
    ["Masters GraphQL"]="Works with GraphQL"
    ["Masters gRPC"]="Works with gRPC"
    ["Masters modern"]="Works with modern"
    ["Masters service"]="Works with service"
    ["Masters event"]="Works with event"
    ["Masters infrastructure"]="Works with infrastructure"
    ["Masters complete"]="Works with complete"
    ["Masters both"]="Works with both"
    ["Masters cutting"]="Works with emerging"
    ["Masters deep"]="Works with detailed"
    
    # Section header replacements
    ["## Expert Purpose"]="## Purpose"
    ["### .* Expertise"]="### Focus"
    ["### .* Mastery"]="### Proficiency"
    ["### Core Expertise"]="### Core Focus"
    ["### Language-Specific Expertise"]="### Language-Specific Focus"
    ["### Cloud Platform Expertise"]="### Cloud Platform Focus"
    ["### Infrastructure as Code Mastery"]="### Infrastructure as Code Proficiency"
    ["### Terraform/OpenTofu Expertise"]="### Terraform/OpenTofu Focus"
    ["### Multi-Cloud Platform Expertise"]="### Multi-Cloud Platform Focus"
    ["### OpenStack Deep Expertise"]="### OpenStack Deep Knowledge"
    ["### Concurrency & Parallelism Mastery"]="### Concurrency & Parallelism Proficiency"
    ["### SwiftUI Mastery"]="### SwiftUI Proficiency"
    ["### React Native Expertise"]="### React Native Focus"
    ["### Flutter & Dart Mastery"]="### Flutter & Dart Proficiency"
    ["### Functional Programming Mastery"]="### Functional Programming Proficiency"
    
    # Other expert-related terms
    ["deep expertise"]="strong knowledge"
    ["deep knowledge"]="strong knowledge"
    ["comprehensive expertise"]="strong capability"
    ["elite specialist"]="specialist"
    ["elite engineer"]="engineer"
    ["elite architect"]="architect"
    ["world-class"]="high-quality"
    ["cutting-edge"]="emerging"
    ["cutting edge"]="emerging"
    ["mastery"]="proficiency"
    ["expertise"]="knowledge"
    ["expert validation"]="careful validation"
    ["expert answer"]="well-researched answer"
    ["expert promotion"]="well-earned promotion"
    ["expert validation"]="careful validation"
    
    # Database-specific master-slave references (technical term, keep as-is)
    # These are technical replication terms, not confidence language
)

# Apply replacements to all markdown files
for file in *.md; do
    if [[ -f "$file" ]]; then
        echo "Processing $file..."
        
        # Create a temporary file
        temp_file=$(mktemp)
        
        # Copy original file to temp
        cp "$file" "$temp_file"
        
        # Apply all replacements
        for pattern in "${!replacements[@]}"; do
            replacement="${replacements[$pattern]}"
            sed -i "s|$pattern|$replacement|g" "$temp_file"
        done
        
        # Handle section headers with regex (more complex patterns)
        sed -i -E 's/### [A-Za-z]+ Expertise/### & Focus/g' "$temp_file"
        sed -i -E 's/### [A-Za-z]+ Mastery/### & Proficiency/g' "$temp_file"
        
        # Move temp file back to original
        mv "$temp_file" "$file"
    fi
done

echo "Expert language removal complete!"
echo "Summary of changes:"
echo "- Replaced 'Expert' role titles with simple role names"
echo "- Replaced 'Master' with 'Work with' or removed entirely"
echo "- Replaced 'specializing' with 'focused on'"
echo "- Replaced 'Masters' with 'Works with'"
echo "- Updated section headers to use 'Focus' instead of 'Expertise'"
echo "- Replaced other overconfident language with more thoughtful terms"
