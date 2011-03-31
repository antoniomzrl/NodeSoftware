# -*- coding: utf-8 -*-

RETURNABLES = {\
'NodeID':'vald',
'SourceID':'Source.id',
'SourceAuthorName':'Source.author',
'SourceCategory':'Source.category',
'SourcePageBegin':'Source.pages',
'SourcePageEnd':'Source.pages',
'SourceName':'Source.journal',
'SourceTitle':'Source.title',
'SourceURI':'Source.url',
'SourceVolume':'Source.volume',
'SourceYear':'Source.year',
#'MethodID':'"MOBS"',
#'MethodCategory':'"observed"',
#'MethodDescription':'',
############################################################
'MoleculeStateID':'MoleculeState.id',
'MoleculeChemicalName':'Molecule.name',
'MoleculeSpeciesID':'Molecule.id',
'MoleculeInchiKey':'Molecule.inchikey',
'MoleculeInchi':'Molecule.inchi',
'MoleculeStateEnergy':'MoleculeState.energy',
'MoleculeStateEnergyRef':'MoleculeState.getRefs("energy")',
'MoleculeStateEnergyUnit':'1/cm',
#############################################################
'AtomStateID':'AtomState.id',
'AtomSymbol':'Atom.name',
'AtomSpeciesID':'Atom.id',
'AtomInchiKey':'Atom.inchikey',
'AtomInchi':'Atom.inchi',
'AtomNuclearCharge':'Atom.atomic',
'AtomIonCharge':'Atom.ion',
'AtomMassNumber':'Atom.massno',
'AtomStateLandeFactor':'AtomState.lande',
'AtomStateLandeFactorUnit':'unitless',
'AtomStateLandeFactorRef':'AtomState.getRefs("lande")',
'AtomStateEnergy':'AtomState.energy',
'AtomStateEnergyRef':'AtomState.getRefs("energy")',
'AtomStateEnergyUnit':'1/cm',
#############################################################
'RadTransSpeciesRef':'RadTran.species_id',
'RadTransComments':'Wavelength is for vacuum.',
'RadTransWavelength':'RadTran.vacwave',
'RadTransWavelengthUnit':u'A',
'RadTransWavelengthRef':'RadTran.getRefs("wave")',
'RadTransFinalStateRef':'RadTran.upstate_id',
'RadTransInitialStateRef':'RadTran.lostate_id',
'RadTransEffectiveLandeFactor':'RadTran.landeff',
'RadTransEffectiveLandeFactorUnit':'unitless',
'RadTransEffectiveLandeFactorRef':'RadTran.getRefs("lande")',
'RadTransProbabilityLog10WeightedOscillatorStrength':'RadTran.loggf',
'RadTransProbabilityLog10WeightedOscillatorStrengthAccuracy':'RadTran.accur',
'RadTransProbabilityLog10WeightedOscillatorStrengthUnit':'unitless',
'RadTransProbabilityLog10WeightedOscillatorStrengthRef':'RadTran.getRefs("loggf")',
'RadTransBroadeningNaturalLineshapeParameter':'RadTran.gammarad',
'RadTransBroadeningNaturalLineshapeParameterName':'log(gamma)',
'RadTransBroadeningNaturalLineshapeParameterUnit':'cm3/s',
'RadTransBroadeningNaturalRef':'RadTran.getRefs("gammarad")',
'RadTransBroadeningNaturalLineshapeName':'lorentzian',
'RadTransBroadeningStarkLineshapeParameter':'RadTran.gammastark',
'RadTransBroadeningStarkLineshapeName':'lorentzian',
'RadTransBroadeningStarkLineshapeParameterName':'log(gamma)',
'RadTransBroadeningStarkLineshapeParameterUnit':'cm3/s',
'RadTransBroadeningStarkRef':'RadTran.getRefs("gammastark")',
'RadTransBroadeningVanDerWaalsLineshapeParameter':'RadTran.getWaals()',
'RadTransBroadeningVanDerWaalsLineshapeParameterUnit':'["cm3/s","unitless"]',
'RadTransBroadeningVanDerWaalsLineshapeName':'lorentzian',
'RadTransBroadeningVanDerWaalsLineshapeParameterName':'["log(gamma)","alpha"]',
'RadTransBroadeningVanDerWaalsRef':'RadTran.getRefs("waals")',
}

RESTRICTABLES = {\
'AtomSymbol':'species__name',
'AtomNuclearCharge':'species__atomic',
'AtomIonCharge':'species__ion',
'AtomStateEnergy':'upstate__energy',
'RadTransWavelength':'vacwave',
'RadTransProbabilityLog10WeightedOscillatorStrength':'loggf',
}


from vamdctap.caselessdict import CaselessDict
RESTRICTABLES = CaselessDict(RESTRICTABLES)
RETURNABLES = CaselessDict(RETURNABLES)
