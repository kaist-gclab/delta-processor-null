import { copyFile } from 'fs/promises';
import { ArgumentParser } from 'argparse';

const parser = new ArgumentParser({
    description: 'delta-processor-null',
});

parser.add_argument('-i', '--input', { help: 'Path to input file', required: true });
parser.add_argument('-o', '--output', { help: 'Path to output file' });

const args = parser.parse_args();

const inputFileName = args['input'];
const outputFileName = args['output'] || ('out.' + inputFileName.split('.').pop());

try {
    copyFile(inputFileName, outputFileName);
} catch {
    console.log('The file could not be copied');
    process.exit(1);
}
