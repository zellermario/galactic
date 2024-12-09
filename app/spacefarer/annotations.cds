using {SpaceFarerService} from '../../srv/SpaceFarerService';

annotate SpaceFarerService.SpaceFarer with @(
  UI.SelectionFields                     : [
    name,
    emailAddress
  ],
  UI.LineItem                            : [
    {
      $Type: 'UI.DataField',
      Value: name,
    },
    {
      $Type: 'UI.DataField',
      Value: emailAddress,
    },
    {
      $Type: 'UI.DataField',
      Value: spaceSuitColor,
    },
    {
      $Type : 'UI.DataFieldForAnnotation',
      Target: '@UI.DataPoint#stardustCollectionSkill'
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action : 'SpaceFarerService.launch',
        Label : 'Launch',
    },
  ],
  UI.DataPoint #stardustCollectionSkill  : {
    Value        : stardustCollectionSkill,
    Visualization: #Rating,
    TargetValue  : 5,
  },
  UI.DataPoint #wormholeNavigationSkill  : {
    Value        : wormholeNavigationSkill,
    Visualization: #Rating,
    TargetValue  : 5,
  },
  UI.SelectionPresentationVariant #table : {
    $Type              : 'UI.SelectionPresentationVariantType',
    PresentationVariant: {
      $Type         : 'UI.PresentationVariantType',
      Visualizations: ['@UI.LineItem', ],
    },
    SelectionVariant   : {
      $Type        : 'UI.SelectionVariantType',
      SelectOptions: [],
    },
  },
  UI.SelectionPresentationVariant #table1: {
    $Type              : 'UI.SelectionPresentationVariantType',
    PresentationVariant: {
      $Type         : 'UI.PresentationVariantType',
      Visualizations: ['@UI.LineItem', ],
    },
    SelectionVariant   : {
      $Type        : 'UI.SelectionVariantType',
      SelectOptions: [],
    },
  },
  UI.Facets                              : [
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Basic Data',
      ID    : 'BasicData',
      Target: '@UI.FieldGroup#BasicData',
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Skills',
      ID    : 'Skills',
      Target: '@UI.FieldGroup#Skills',
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Affiliation',
      ID    : 'Affiliation',
      Target: '@UI.FieldGroup#Affiliation',
    },
  ],
  UI.FieldGroup #BasicData               : {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Value: name,
      },
      {
        $Type: 'UI.DataField',
        Value: spaceSuitColor,
      },
      {
        $Type: 'UI.DataField',
        Value: emailAddress,
      },
      {
        $Type: 'UI.DataField',
        Value: originPlanetName,
        Label: 'Origin planet',
      },
    ],
  },
  UI.FieldGroup #Skills                  : {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type : 'UI.DataFieldForAnnotation',
        Target: '@UI.DataPoint#stardustCollectionSkill',
        Label : 'Stardust collection skill level',
      },
      {
        $Type : 'UI.DataFieldForAnnotation',
        Target: '@UI.DataPoint#wormholeNavigationSkill',
        Label : 'Wormhole navigation skill level',
      }
    ],
  },
  UI.HeaderInfo                          : {
    Title         : {
      $Type: 'UI.DataField',
      Value: name,
    },
    TypeName      : 'Space farer',
    TypeNamePlural: 'Space farers',
  },
  UI.FieldGroup #Affiliation             : {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Value: departmentName,
        Label: 'Department',
      },
      {
        $Type: 'UI.DataField',
        Value: positionName,
        Label: 'Position',
      },
    ],
  },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'SpaceFarerService.launch',
            Label : 'Launch',
        },
    ],
);

annotate SpaceFarerService.SpaceFarer with {
  name                    @Common.Label: 'Name';
  emailAddress            @Common.Label: 'Email address';
  spaceSuitColor          @Common.Label: 'Spacesuite color';
  stardustCollectionSkill @Common.Label: 'Stardust collection';
  wormholeNavigationSkill @Common.Label: 'Wormhole navigation';
  originPlanetName        @Common.Label: 'Origin planet';
  position                @Common.Label: 'Position';
  departmentName          @Common.Label: 'Department';
  positionName            @Common.Label: 'Position';
};
