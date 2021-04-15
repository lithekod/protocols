#!/bin/sh
date=$(date +%y%m%d)

VERKSAMHET_YEAR="20-21/" # Update me at July 1st!

template="template.md"

while [[ $# -gt 0 ]]; do
    arg="$1"
    case $arg in
        --date|-d)
            shift
            date="$1"
            shift
            ;;
        --template|-t)
            shift
            template="$1"
            shift
            ;;
        --help|-h)
            shift
            echo "usage: $0 [--help|-h] [--date|-d <date>] [--template|-t <template-file>]"
            echo ""
            echo "Create a new empty protocol from a template."
            exit 0
            ;;
        *)
            echo "unknown option: $1"
            echo "Run '$0 --help' for usage"
            exit 1
            ;;
    esac
done

file="${VERKSAMHET_YEAR}styrelsemote_$(date --date="$date" +%y%m%d).md"

sed "s/{DATE}/$(date --date="$date" '+%-d %B %Y')/g" \
    > "$file" \
    < "$template"

unlink next.md
ln -s "$file" next.md
