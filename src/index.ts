import { readFileSync, writeFileSync } from 'fs';
import { ArgumentParser } from 'argparse';

const parser = new ArgumentParser({
    description: 'delta-processor-null',
});

parser.add_argument('-i', '--input', { help: 'Path to input file', required: true });
parser.add_argument('-o', '--output', { help: 'Path to output file' });

const args = parser.parse_args();

const inputFileName = args['input'] as string;
const outputFileName = args['output'] as string || ('out.' + inputFileName.split('.').pop());

// Copy file.
// Due to the permission problem, we cannot use `fs.copyFile` or `fs.copyFileSync`.
// Instead, we read the file content and write to the output file.
const data = readFileSync(inputFileName);
try {
    writeFileSync(outputFileName, data);
} catch (e) {
    console.log('The file could not be written');
    console.error(e);
    process.exit(1);
}
