# Overview

CloudBR Terminal is a credential processing system designed to analyze and extract email/password combinations from text files and compressed archives. The system focuses specifically on Brazilian domains and services, providing specialized detection for Brazilian email addresses and websites. It processes various file formats (TXT, ZIP, RAR) up to 4GB in size and stores results in a structured database for analysis.

# User Preferences

Preferred communication style: Simple, everyday language.

# System Architecture

## Core Processing Engine
The system is built around a Python-based terminal application that provides an interactive command-line interface in Portuguese. The main processing logic handles credential extraction using regular expressions to identify email:password patterns from various file sources.

## File Processing System
- **Multi-format Support**: Handles TXT, ZIP, and RAR file formats
- **Large File Handling**: Designed to process files up to 4GB in size
- **Archive Extraction**: Integrated support for compressed archives using zipfile and rarfile libraries
- **Encoding Detection**: Handles various text encodings commonly found in credential dumps

## Database Layer
- **SQLite Integration**: Uses SQLite3 for local data storage and analysis
- **Credential Storage**: Structured storage of extracted email/password combinations
- **Brazilian Domain Classification**: Specialized categorization system for Brazilian domains and services

## Domain Detection System
- **Brazilian Domain Recognition**: Comprehensive list of Brazilian TLDs (.com.br, .br, etc.)
- **Known Brazilian Services**: Curated list of major Brazilian websites and services
- **Pattern Matching**: Regular expression-based credential extraction and validation

## User Interface
- **Terminal Interface**: Interactive command-line interface with Portuguese language support
- **Progress Tracking**: Real-time processing feedback and statistics
- **Results Presentation**: Organized display of extracted credentials with Brazilian domain prioritization

# External Dependencies

## Core Python Libraries
- **zipfile**: Built-in library for ZIP archive processing
- **rarfile**: Third-party library for RAR archive extraction
- **sqlite3**: Built-in database interface for local data storage
- **re**: Regular expression library for pattern matching

## System Dependencies
- **subprocess**: For executing external commands and system operations
- **os/sys**: System-level file and directory operations
- **datetime**: Timestamp and date handling for processing logs

## File System Requirements
- **Large File Support**: System must support files up to 4GB
- **Archive Processing**: Requires proper handling of compressed file formats
- **Database Storage**: Local SQLite database for persistent credential storage

The architecture prioritizes Brazilian credential detection and processing, making it specialized for analyzing credential dumps relevant to Brazilian users and services.