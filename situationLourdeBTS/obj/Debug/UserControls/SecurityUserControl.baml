   M S B A M L   `   `   `  ����M  IsituationLourdeBTS, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullQ-clr-namespace:situationLourdeBTS.UserControlssituationLourdeBTS.UserControls  5      7 clr-namespace:situationLourdeBTSsituationLourdeBTS  5      9    3situationLourdeBTS.UserControls.SecurityUserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ?local-clr-namespace:situationLourdeBTS.UserControls     5      ?situationLourdeBTS clr-namespace:situationLourdeBTS     5      -   5           MainContentControl_Width#���   5	   7     MainContentControl_Height#���  6j     � 	Resources  5
        securityLevelViewSource��%   &	       �� 5   
   6   5      .��5      � .+�5   
   � -   5         �Name$ grid1��5      $	��Top=�6   $��
32,106,0,0q�66   $
��Left=�6J    � DataContext# [ 6e    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6     � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#   .+�5      �� $��Center=�6   $��0��6/   $��3q�6<   $
��Left=�6G   $��0��6b   $��Description:��6r   �� 5      -   5         ��Name$ descriptionTextBox��5      $	��120��62   $��Center=�6>   $��0��6�   $��3q�6�   $��23��6�   $
��Left=�6�   $��1��6�   ��6Y   �� *Description+ �� Mode$ TwoWay=� �� NotifyOnValidationError .  �� ValidatesOnExceptions . 6�   �� 5      $��Center=�6   $��1��6/   $��3q�6<   $
��Left=�6G   $��0��6b   $	��Id:��6r   �� 5      -   5        $ 	idTextBox��5      	 �� 
IsReadOnly	 . $	��120��6;   $��Center=�6G   $��1��6�   $��3q�6�   $��23��6�   $
��Left=�6�   $��1��6�   ��6b   �� *Id+$ TwoWay=� .  . 6�   5      �� 5   
   -   5        
 ��Name$
 	AddButton��5      $��Ajouter��6$   $
��Left=�66   $��149,479,0,0q�6Q   $	��Top=�6f   $��98��6~   $��38��6�   6�   �� 5   
   -   5        $
 DeleteButton��5      $��	Supprimer��6'   $
��Left=�6;   $��
28,479,0,0q�6V   $	��Top=�6j   $��98��6�   $��38��6�   6�   5       5!      