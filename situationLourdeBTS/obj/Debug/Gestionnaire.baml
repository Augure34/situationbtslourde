   M S B A M L   `   `   `  ����M  IsituationLourdeBTS, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:situationLourdeBTSsituationLourdeBTS  5   	   M+clr-namespace:situationLourdeBTS.PropertiessituationLourdeBTS.Properties  5   	   %    situationLourdeBTS.Gestionnaire   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:situationLourdeBTS     5   	   9p+clr-namespace:situationLourdeBTS.Properties     5   	   -   5          � Title$  Gestionnaire��5	   	   $	��600��6   $
��1052��6+   ���	#FFAAAAAA � 	Resources 5
         employeeViewSource  roomViewSource  securityLevelViewSource��%W   &	        &	      &	 &     �� 5   
   6   �� 5   
   6   �� 5   
   6   5      .��5      � -   5         �Name$ MainGrid��5       5   
   ,   &situationLourdeBTS.BoolToEnumConverter  boolToEnumConverter��%   &	         5      6(   5      .+�5   
   �� -   5         ��Name$ DatabaseComboBox��5      $
��Left=�6-   $��
422,25,0,0q�6H   $	��Top=�6\   $	��131��6t   $��34��6�    �� SelectedIndex$ 0��6�   $��16(�6�    �� SelectedValuePath$	 Key��6�    �� DisplayMemberPath$	 Key��6  ��6�   �� ,   &situationLourdeBTS.Properties.Settings   Default �� Source# Z 	 �� Path$	 Connections�5      �� 5   
   -   5        
 ��Name$
 label��5      $��Base actuelle:��6   $��444,3,352,535q�68   �� 5   
   -   5         ��Name$ NewBaseButton��5      $��Nouvelle base��6(   $
��Left=�6@   $��
422,86,0,0q�6[   $	��Top=�6o   $	��131��6�   $��43��6�   6�   �� 5   
   -   5        $ PropertiesButton��5      $��Propriétées de la base��6+   $
��Left=�6L   $��
582,86,0,0q�6g   $	��Top=�6{   $	��140��6�   $��43��6�   6�   �� 5   
   -   5        $ ConnexionButton��5      $��	Connexion��6*   $
��Left=�6>   $��
582,25,0,0q�6Y   $	��Top=�6m   $	��140��6�   $��34��6�   6�   �� 5   
   $
��Left=�6   $��41��6/   $��360,129,0,0q�6;   $	��Top=�6P   $	��377��6h   �� 5   
   -   5        $ AddUserButton��5      $��Ajout utilisateur��6(   $
��Left=�6D   $��500,171,0,0q�6_   $	��Top=�6t   $	��140��6�   $��43��6�   6�   �� 5   
   $
��Left=�6   $��41��6/   $��360,219,0,0q�6;   $	��Top=�6P   $	��377��6h   	� 5   
   -	   5         	�Name$ EmployeesRadioButton��5      $��Utilisateurs��64   
 � Tag$ 0��6K   $
��Left=�6S   $��	27,28,0,0q�6n   $	��Top=�6�   	� 5   
   -
   5        $ RoomsRadioButton��5      $��Salles��60   $ 1��6A   $
��Left=�6I   $��
117,28,0,0q�6d   $	��Top=�6x   	� 5   
   -   5        $ SecClearancesRadioButton��5      $��Niveaux de sécurité��68   $ 2��6V   $
��Left=�6^   $��
187,28,0,0q�6y   $	��Top=�6�    d� 	IsChecked$
 TrueY�6�   �� 5    
   -   5        $ AddRoomButton��5       $��Ajout salle��6(   $
��Left=�6>   $��500,271,0,0q�6Y   $	��Top=�6n   $	��140��6�   $��43��6�   6�   �� 5!   
   $
��Left=�6   $��41��6/   $��360,319,0,0q�6;   $	��Top=�6P   $	��377��6h   �� 5"   
   -   5        $ AddSecClearanceButton��5"      $��Ajout sécurité��60   $
��Left=�6I   $��500,371,0,0q�6d   $	��Top=�6y   $	��140��6�   $��43��6�   6�   �� 5#   
   $
��Left=�6   $��41��6/   $��360,414,0,0q�6;   $	��Top=�6P   $	��377��6h   �� 5$   
   -   5        $ 
SaveButton��5$      $��Sauvegarder��6%   $
��Left=�6;   $��150,493,0,0q�6V   $	��Top=�6k   $	��106��6�   $��50��6�   6�   �� 5%   
   -   5        $ 
QuitButton��5%      $��Quitter��6%   $
��Left=�67   $��558,493,0,0q�6R   $	��Top=�6g   $	��106��6   $��50��6�   6�   &   System.Windows.Controls.DataGrid  5&   
   -   5          Name$ securityLevelDataGrid��5&         
IsReadOnly .    AutoGenerateColumns .    EnableRowVirtualization . $��10,60,660,96q�6�      RowDetailsVisibilityMode$ VisibleWhenSelected=�6�      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 6  ��6~   �� 6-  �� 5'   
   
���   �$��1q�6%   $
��Left=�69   $	��534��6T   $��
744,19,0,0q�6a   $	��Top=�6u   $	��279��6�   �� 5(   
   -   5         ��Name$ ControlArea��5(      $�� ��6.   $
��Left=�69   $��
744,22,0,0q�6T   $	��Top=�6h     MainContentControl_Height#���  6�     MainContentControl_Width#���  6�   5*      5+      