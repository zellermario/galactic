import { SpaceFarer } from "#cds-models/db";

type ValidationResult 
  = { isValid: true } 
  | { isValid: false, errors: string[] };

type Validator<T> = (target: T) => ValidationResult;

function accept(): ValidationResult {
  return { isValid: true };
}

function rejectWith(error: string): ValidationResult {
  return { isValid: false, errors: [error] };
}

function rejectWithMany(errors: string[]): ValidationResult {
  return { isValid: false, errors };
}

function validateByAll<T>(validators: Validator<T>[], target: T): ValidationResult {
  const errors = validators
    .map(validator => validator(target))
    .filter(result => !result.isValid)
    .flatMap(result => result.errors);
  
    if (errors.length > 0) {
      return rejectWithMany(errors);
    }
    return accept();
}

export function validateSpaceFarer(spaceFarer: SpaceFarer): ValidationResult {
  const validators = [
    
  ];
  return validateByAll(validators, spaceFarer);
}