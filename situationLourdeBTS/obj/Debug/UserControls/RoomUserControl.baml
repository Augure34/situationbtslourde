   M S B A M L   `   `   `  ����M  IsituationLourdeBTS, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullQ-clr-namespace:situationLourdeBTS.UserControlssituationLourdeBTS.UserControls  5      7 clr-namespace:situationLourdeBTSsituationLourdeBTS  5      5    /situationLourdeBTS.UserControls.RoomUserControl   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ?local-clr-namespace:situationLourdeBTS.UserControls     5      ?situationLourdeBTS clr-namespace:situationLourdeBTS     5      -   5           MainContentControl_Width#���   5	   7     MainContentControl_Height#���  6j     � 	Resources  5
        roomViewSource��%   &	       �� 5   
   6   5      .��5      � .+�5   
   �� -   5         ��Name$ 	AddButton��5      $��Ajouter��6$   $
��Left=�66   $��149,479,0,0q�6Q   $	��Top=�6f   $��98��6~   $��38��6�   6�   �� 5   
   -   5        $ DeleteButton��5      $��	Supprimer��6'   $
��Left=�6;   $��
28,479,0,0q�6V   $	��Top=�6j   $��98��6�   $��38��6�   6�   � 5   
   -   5         �Name$ grid1��5       � DataContext# [ 6   $
��Left=�6L   $��	44,69,0,0q�6g   $	��Top=�6z    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    .+�5      �� $	��Id:��6   $��0��6"   $
��Left=�62   $��3q�6M   $��0��6X   $��Center=�6e   �� 5      -   5         ��Name$ 	idTextBox��5      $��1��6)   $
��Left=�69   $��23��6T   $��3q�6`   $��0��6k   $��Center=�6�   $	��120��6�   ��6x   �� *Id+ �� Mode$ TwoWay=� �� NotifyOnValidationError . 	 �� ValidatesOnExceptions	 . 6�   �� 5      $
��Nom:��6   $��0��6#   $
��Left=�63   $��3q�6N   $��1��6Y   $��Center=�6f   �� 5      -   5        $ nameTextBox��5      $��1��6+   $
��Left=�6;   $��23��6V   $��3q�6b   $��1��6m   $��Center=�6�   $	��120��6�   ��6z   �� *Name+$ TwoWay=� . 	 . 6�   �� 5      -   5        
 ��Name$
 ActiveSecListBox��5      $
��Left=�60   $	��295��6K   $��-36,57,0,-320q�6X   $��Center=�6o   $	��117��6�   $��1��6�   $��0��6�   $��2��6�    �� DisplayMemberPath$ Description��6-  ��6�   ��  �� Path$ .�$ TwoWay=� . 	 . 6-  �� 5      -   5        $
 InactiveSecListBox��5      $
��Left=�62   $	��295��6M   $��62,57,-54,-320q�6Z   $��Center=�6r   $	��118��6�   $��1��6�   $��1��6�   $ Description��6  ��6�   �� $ .�$ TwoWay=� . 	 . 6  5      �� 5    
   -	   5        $ EnableSecButton��5       $��<��6*   $
��Left=�69   $��126,266,0,0q�6T   $	��Top=�6i   $��24��6�   $��24��6�   6�   �� 5!   
   -
   5        $ DisableSecButton��5!      $��>��6+   $
��Left=�6:   $��126,299,0,0q�6U   $	��Top=�6j   $��24��6�   $��24��6�   6�   5#      5$      