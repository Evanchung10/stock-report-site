#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <ticker> <report-html-path> <title>"
  exit 1
fi

ticker="$1"
source_html="$2"
title="$3"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
site_dir="$(cd "$script_dir/.." && pwd)"
target_dir="$site_dir/public/reports/$ticker"
target_html="$target_dir/index.html"

if [ ! -f "$source_html" ]; then
  echo "Report not found: $source_html"
  exit 1
fi

mkdir -p "$target_dir"
cp "$source_html" "$target_html"

echo "Published $title"
echo "Local path: $target_html"
echo "Site URL path: /reports/$ticker/"
