   M S B A M L   `   `   `  ����M  IsituationLourdeBTS, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullQ-clr-namespace:situationLourdeBTS.UserControlssituationLourdeBTS.UserControls  5      7 clr-namespace:situationLourdeBTSsituationLourdeBTS  5      9    3situationLourdeBTS.UserControls.EmployeeUserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ?local-clr-namespace:situationLourdeBTS.UserControls     5      ?situationLourdeBTS clr-namespace:situationLourdeBTS     5      -   5           MainContentControl_Width#���   5	   7     MainContentControl_Height#���  6j     � 	Resources  5
        employeeViewSource��%   &	       �� 5   
   6   5      .��5      � .+�5   
   � -   5         �Name$ grid1��5       � DataContext# [ 6   $
��Left=�6P   $��	15,33,0,0q�6k   $	��Top=�6~    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    .+�5      �� $��Clearance Expiration:��6   $��0��64   $
��Left=�6D   $��3q�6_   $��0��6j   $��Center=�6w   (  "System.Windows.Controls.DatePicker  5      -   5          Name$# clearanceExpirationDatePicker��5      $��1��6@   $
��Left=�6P   $��3q�6k   $��0��6v   $��Center=�6�      SelectedDate 6�   �� *ClearanceExpiration+ �� Mode$ TwoWay=� �� NotifyOnValidationError . 	 �� ValidatesOnExceptions	 . 6�   �� 5      $	��Id:��6   $��0��6"   $
��Left=�62   $��3q�6M   $��1��6X   $��Center=�6e   �� 5      -   5        
 ��Name$
 	idTextBox��5      $��1��6)   $
��Left=�69   $��23��6T   $��3q�6`   $��1��6k   $��Center=�6�   $	��120��6�   ��6x   �� *Id+$ TwoWay=� . 	 . 6�   �� 5      $��Name:��6   $��0��6$   $
��Left=�64   $��3q�6O   $��2��6Z   $��Center=�6g   �� 5      -   5        $
 nameTextBox��5      $��1��6+   $
��Left=�6;   $��23��6V   $��3q�6b   $��2��6m   $��Center=�6�   $	��120��6�   ��6z   �� *Name+$ TwoWay=� . 	 . 6�   �� 5      $��Security Level:��6   $��0��6.   $
��Left=�6>   $��3q�6Y   $��3��6d   $��Center=�6q   �� 5       -   5         ��Name$ securityLevelComboBox��5       $��1��66    �� DisplayMemberPath$ Description��6F    �� SelectedValuePath$ Id��6f   $
��Left=�6}   $
��Auto��6�   $��3q�6:  $��3��6E  $��Center=�6R  $	��120��6m  ��6�   ��  �� Path$ 	secLevels� �� SelectedItem 6�   �� *SecurityLevel+$ TwoWay=� . 	 . ��5!      �� 5"      .R�5#      $� 5$      5&      5'      �� 5(   
   -   5         ��Name$ 	AddButton��5(      $��Ajouter��6$   $
��Left=�66   $��149,479,0,0q�6Q   $	��Top=�6f   $��98��6~   $��38��6�   6�   �� 5)   
   -   5        $ DeleteButton��5)      $��	Supprimer��6'   $
��Left=�6;   $��
28,479,0,0q�6V   $	��Top=�6j   $��98��6�   $��38��6�   6�   5*      5+      