#!/usr/bin/perl

use strict;
use warnings;
use JSON;

# Read extensions from extensions.json
open my $extensions_file, '<', 'extensions.json' or die "Error: Unable to open extensions.json.";
my $json_data = do { local $/; <$extensions_file> };
close $extensions_file;
my @extensions = @{decode_json($json_data)};

print "🚀 Checking and installing VSCode extensions...\n";

# Check and install extensions
foreach my $extension (@extensions) {
    my $installed = `code --list-extensions`;
    if ($installed =~ /$extension/) {
        print "✅ $extension already installed.\n";
    } else {
        system("code --install-extension $extension") == 0 or die "Error: Unable to install extensions.";
        print "⬇️ Installing $extension...\n";
    }
}

print "🎉 Installation successful!\n";
